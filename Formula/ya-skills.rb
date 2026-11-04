class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v2.1.3/ya-skills-v2.1.3-macos-arm64.tar.gz"
  sha256 "bf39bd22d2f4917531651b1cd360b6f2fdd0ff8dac51e743e37bde1e15a03c0f"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk", "runtime"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "2.1.3", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
    assert_match "computer-use", shell_output("#{bin}/yk list")
  end
end
