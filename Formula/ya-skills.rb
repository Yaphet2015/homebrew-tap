class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.5.0/ya-skills-v0.5.0-macos-arm64.tar.gz"
  version "0.5.0"
  sha256 "54b611c0c55c8aa5c5ed29a501bc97e90b10c8e6626f52dcabf0ff4b32f57a0a"
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
