class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v1.1.2/ya-skills-v1.1.2-macos-arm64.tar.gz"
  sha256 "283c6b4663f3c9305a7c4d7c9133ab17b53b619c03c9fb21707f6a23adda8fb3"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk", "runtime"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "1.1.2", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
    assert_match "computer-use", shell_output("#{bin}/yk list")
  end
end
