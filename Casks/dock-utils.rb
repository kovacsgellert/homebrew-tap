cask "dock-utils" do
  version "2.3.1"
  sha256 "62cb11ad9520886f224eff87d75468b01657bcf7b19b7ad4049bc6d36f8a98bd"

  url "https://github.com/kovacsgellert/dock-utils-mac/releases/download/#{version}/dock-utils-#{version}-macos-universal.dmg"
  name "DockUtils"
  desc "Dock number shortcuts and Dock clones on other displays"
  homepage "https://github.com/kovacsgellert/dock-utils-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "DockUtils.app"

  zap trash: [
    "~/.config/dock-shortcuts",
    "~/.config/dock-utils",
    "~/Library/LaunchAgents/com.kovacsgellert.dock-shortcuts.plist",
    "~/Library/LaunchAgents/com.kovacsgellert.dock-utils.plist",
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
