cask "ai-usage" do
  version "1.5.1"
  sha256 "7749786c8f0f8de8ad9b000c4a79a93e4378e787cd8de5016a172435ce7253e4"

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
