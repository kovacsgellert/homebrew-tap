cask "kanata-gui" do
  version "0.1.1"
  sha256 "c7b23d07bd55391cd1ae8e45475870a7e725da54f193c0b72a52e513d545cb19"

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
