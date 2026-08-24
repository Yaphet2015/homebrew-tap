class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.9.0/ya-skills-v0.9.0-macos-arm64.tar.gz"
  version "0.9.0"
  sha256 "0996a9b98ce930f3418ef5b357791c43a73da0ddcf40a4e3fca5c36bafcc6b91"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
  end
end
