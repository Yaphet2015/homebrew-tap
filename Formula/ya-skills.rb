class YaSkills < Formula
  desc "Personal skill repository and yk CLI"
  homepage "https://github.com/Yaphet2015/ya-skills"
  url "https://github.com/Yaphet2015/ya-skills/releases/download/v0.14.0/ya-skills-v0.14.0-macos-arm64.tar.gz"
  sha256 "14e177ced9a54652974384e48085062da1cbf801af228511abf29d7cb4cb1a6c"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "yk"
    pkgshare.install "skills"
    (bin/"yk").write_env_script libexec/"yk", YA_SKILLS_CATALOG_DIR: pkgshare/"skills"
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/yk --version")
    assert_match "pbench", shell_output("#{bin}/yk list")
  end
end
