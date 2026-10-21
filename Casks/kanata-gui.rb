cask "kanata-gui" do
  version "0.1.3"
  sha256 "d9d89182729d96e93290ee1cec22ad8570af0f7f8bbfaed5ce201e885fc21b84"

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
