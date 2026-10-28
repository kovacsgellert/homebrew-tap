cask "kanata-gui" do
  version "0.2.0"
  sha256 "4c71a834304fccd7c3c40fc7b3be47d79562bad837e3fa7e9a760f0cfdef706f"

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
      The app is not notarized, so Gatekeeper blocks the first launch:
      open it once, then System Settings → Privacy & Security →
      Open Anyway (macOS 15+), or right-click → Open (macOS 14).
    EOS
  end
end
