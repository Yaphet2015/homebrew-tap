class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.7.0/ya-skills-v0.7.0-macos-arm64.tar.gz"
  version "0.7.0"
  sha256 "f2c7250665a25c25ada13c5d31862e2972a6887c151d7ac365c6cc8e50823d6a"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "pbench", shell_output("#{bin}/yk list")
    assert_equal "hello\n", shell_output("#{bin}/yk demo echo hello")
  end
end
