cask "ai-usage" do
  version "1.10.0"
  sha256 "dd14a66d7ddd64f9f4d4082095ea39712056fdd1d84fe724164ff80706bc1b50"

  url "https://github.com/g-akrp/albert-ai-usage/releases/download/v#{version}/AIUsage-#{version}.dmg"
  name "AI Usage"
  desc "Menu bar usage meters for AI coding tools"
  homepage "https://github.com/g-akrp/albert-ai-usage"

  depends_on macos: :ventura

  app "AI Usage.app"

  # Ad-hoc signed, not notarized: clear the quarantine flag so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/AI Usage.app"],
        writable_paths: ["{{appdir}}/AI Usage.app"]
  end

  zap trash: "~/Library/Preferences/local.ai-usage.plist"
end
