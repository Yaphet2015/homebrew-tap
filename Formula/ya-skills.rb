class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.4.3/ya-skills-v0.4.3-macos-arm64.tar.gz"
  version "0.4.3"
  sha256 "fa2d619b860baf78630ef3dcfd5dfa59ca78025dbeef0da399fba397ab5905de"
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
