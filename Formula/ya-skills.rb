class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v1.1.1/ya-skills-v1.1.1-macos-arm64.tar.gz"
  sha256 "d6a3fbf6588aa7a4ce637e308add3f1002302f7db4355640b4bf7044639650f5"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk", "runtime"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "1.1.1", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
    assert_match "computer-use", shell_output("#{bin}/yk list")
  end
end
