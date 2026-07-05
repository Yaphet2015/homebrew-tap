cask "prokcy" do
  version "1.8.17"

  on_arm do
    sha256 "b3d1bbfc0c39751de64cb18d05b45fa7e9602462f8db5979f9d19083c5183993"

    url "https://github.com/Yaphet2015/Prokcy/releases/download/v#{version}/Prokcy-v#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "f8d14f97f02b7538101808c31aceb052b274bd7bb4ff6d6cf65141283d56cacf"

    url "https://github.com/Yaphet2015/Prokcy/releases/download/v#{version}/Prokcy-v#{version}-mac-x64.dmg"
  end

  name "Prokcy"
  desc "Desktop proxy client based on Whistle"
  homepage "https://github.com/Yaphet2015/Prokcy"

  depends_on macos: :monterey

  app "Prokcy.app"
end
