class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.6.0/ya-skills-v0.6.0-macos-arm64.tar.gz"
  version "0.6.0"
  sha256 "23d8339f751e6e3de1e4900c6aa0c9c60b14195cad01b445e899174fdf10b4d0"
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
