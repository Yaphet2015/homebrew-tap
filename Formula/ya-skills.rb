class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v2.5.1/ya-skills-v2.5.1-macos-arm64.tar.gz"
  sha256 "815dfdbff0ad28101aefb9a085f97307f27c12f7105a6dc334b4da6bea4d3ff2"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk", "runtime"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "2.5.1", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
    assert_match "computer-use", shell_output("#{bin}/yk list")
  end
end
