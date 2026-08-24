class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.11.0/ya-skills-v0.11.0-macos-arm64.tar.gz"
  version "0.11.0"
  sha256 "ba76b7c1596d82df7026a2fffeb6df3634ee4899bbf30efc7bdc1eb4ac8038a0"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
  end
end
