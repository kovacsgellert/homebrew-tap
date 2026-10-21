cask "dock-shortcuts" do
  version "1.3.0"
  sha256 "162125f652d2cc8836edc3dc0362affc77641908d765ea2445b0aee77cd89afa"

  url "https://github.com/kovacsgellert/dock-shortcuts-mac/releases/download/#{version}/dock-shortcuts-#{version}-macos-arm64.dmg"
  name "DockShortcuts"
  desc "Keyboard-first Dock app switcher"
  homepage "https://github.com/kovacsgellert/dock-shortcuts-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "DockShortcuts.app"

  zap trash: [
    "~/.config/dock-shortcuts",
    "~/Library/LaunchAgents/com.kovacsgellert.dock-shortcuts.plist",
  ]

  caveats do
    <<~EOS
      DockShortcuts needs Accessibility permission:
        System Settings → Privacy & Security → Accessibility.
      The app is not notarized, so Gatekeeper blocks the first launch:
      open it once, then System Settings → Privacy & Security →
      Open Anyway (macOS 15+), or right-click → Open (macOS 14).
    EOS
  end
end
