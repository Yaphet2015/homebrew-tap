class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.25.0/ya-skills-v0.25.0-macos-arm64.tar.gz"
  sha256 "e74d1ac6a3cb4a89e137b6ba44ea2099c49e74134e4b2ea6c8621a3266c8deba"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk", "runtime"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "0.25.0", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
    assert_match "computer-use", shell_output("#{bin}/yk list")
  end
end
