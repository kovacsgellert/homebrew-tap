cask "dock-utils" do
  version "2.0.0"
  sha256 "8f3a2dd86b344af1faeef2f753e1f1b4802b245ef322ee69f6a091d5c7a725a6"

  url "https://github.com/kovacsgellert/dock-utils-mac/releases/download/#{version}/dock-utils-#{version}-macos-arm64.dmg"
  name "DockUtils"
  desc "Dock number shortcuts and Dock clones on other displays"
  homepage "https://github.com/kovacsgellert/dock-utils-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "DockUtils.app"

  zap trash: [
    "~/.config/dock-utils",
    "~/.config/dock-shortcuts",
    "~/Library/LaunchAgents/com.kovacsgellert.dock-utils.plist",
    "~/Library/LaunchAgents/com.kovacsgellert.dock-shortcuts.plist",
  ]

  caveats do
    <<~EOS
      DockUtils needs Accessibility permission:
        System Settings → Privacy & Security → Accessibility.
      The app is not notarized, so Gatekeeper blocks the first launch:
      open it once, then System Settings → Privacy & Security →
      Open Anyway (macOS 15+), or right-click → Open (macOS 14).
      Coming from DockShortcuts: grant Accessibility to DockUtils, then
      remove the old DockShortcuts entry there.
    EOS
  end
end
