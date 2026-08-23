class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.8.0/ya-skills-v0.8.0-macos-arm64.tar.gz"
  version "0.8.0"
  sha256 "142ec4a83c945e5e145d29db48f55f8d8cfd0e2add741190bd5802953c7618ca"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
  end
end
