cask "dock-shortcuts" do
  version "1.2.0"
  sha256 "0a80f3072a12a24de36c98828b0c14a48455b887ce14c09b947bd17bc517fa1d"

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
      The app is not notarized, so on first launch
      right-click it and choose Open.
    EOS
  end
end
