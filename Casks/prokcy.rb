cask "prokcy" do
  version "1.8.16"

  on_arm do
    sha256 "d6e2db83425f1bbdc8fe058b348d391b57e7f6e7bb605ef329e6de93866302b0"

    url "https://github.com/Yaphet2015/Prokcy/releases/download/v#{version}/Prokcy-v#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "585577868582dc6d740dca1ffecdf75c1c9a74491d13eddb7e3c9b69619ba34b"

    url "https://github.com/Yaphet2015/Prokcy/releases/download/v#{version}/Prokcy-v#{version}-mac-x64.dmg"
  end

  name "Prokcy"
  desc "Desktop proxy client based on Whistle"
  homepage "https://github.com/Yaphet2015/Prokcy"

  depends_on macos: :monterey

  app "Prokcy.app"
end
