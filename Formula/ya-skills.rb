class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.1.0/ya-skills-v0.1.0-macos-arm64.tar.gz"
  sha256 "fed524dc26547766007334ca4fce5427f81f21f3844e941c84a93885e6836fc3"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk"
    pkgshare.install "skills"
    bin.write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "pbench", shell_output("#{bin}/yk list")
    assert_equal "hello\n", shell_output("#{bin}/yk demo echo hello")
  end
end
