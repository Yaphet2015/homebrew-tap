class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.16.0/ya-skills-v0.16.0-macos-arm64.tar.gz"
  sha256 "9efa3a61064f12df185dcd1aadd1ea2cd11153487d9b45840fb872cb905d211b"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
  end
end
