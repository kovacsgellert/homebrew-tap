cask "kanata-gui" do
  version "0.1.0"
  sha256 "88166fda536739b31c16e2c0799668a8f7e4471ddbb86fdec1be62c86b371fa9"

  url "https://github.com/kovacsgellert/kanata-gui-mac/releases/download/#{version}/kanata-gui-#{version}-macos-arm64.dmg"
  name "KanataGUI"
  desc "Menu-bar GUI for the kanata keyboard remapper"
  homepage "https://github.com/kovacsgellert/kanata-gui-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "KanataGUI.app"

  zap trash: "~/Library/Application Support/kanata-gui"

  caveats do
    <<~EOS
      KanataGUI needs a one-time privileged setup (root LaunchDaemon
      for kanata) — follow the prompt in the app on first launch.
      It also needs kanata and the Karabiner VirtualHID driver;
      see the README for the verified versions.
      The app is not notarized, so on first launch
      right-click it and choose Open.
    EOS
  end
end
