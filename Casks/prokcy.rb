cask "prokcy" do
  version "1.8.15"

  on_arm do
    sha256 "6ca27748a49d1f990df85745a6f3f5a502f822ae3c7872601ce4efe1fcae2753"

    url "https://github.com/Yaphet2015/Prokcy/releases/download/v#{version}/Prokcy-v#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "2fa53f2b19326e7a5f7cf374ae8dfe490bd1e94bfe9ee5097f1af8bdc14271b0"

    url "https://github.com/Yaphet2015/Prokcy/releases/download/v#{version}/Prokcy-v#{version}-mac-x64.dmg"
  end

  name "Prokcy"
  desc "Desktop proxy client based on Whistle"
  homepage "https://github.com/Yaphet2015/Prokcy"

  depends_on macos: :monterey

  app "Prokcy.app"
end
