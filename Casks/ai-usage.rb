cask "ai-usage" do
  version "1.6.0"
  sha256 "5a4711c2bcb2de26d66cfbb2650f24733fecfca76c8df019ce14e90e4e36928b"

  url "https://github.com/g-akrp/albert-ai-usage/releases/download/v#{version}/AIUsage-#{version}.dmg"
  name "AI Usage"
  desc "Menu bar usage meters for AI coding tools"
  homepage "https://github.com/g-akrp/albert-ai-usage"

  app "AI Usage.app"

  # Ad-hoc signed, not notarized: clear the quarantine flag so Gatekeeper lets it open.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/AI Usage.app"]
  end

  zap trash: "~/Library/Preferences/local.ai-usage.plist"
end
