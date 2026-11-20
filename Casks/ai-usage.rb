cask "ai-usage" do
  version "1.17.0"
  sha256 "246f756d787bedfe78acf89b78e34409e34fc32f78e0cc78711a97fe0eb80420"

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

  # Restart so an upgrade runs the new build.
  postflight do
    system_command "/usr/bin/killall", args: ["AIUsage"], must_succeed: false
    system_command "/bin/sleep", args: ["2"]
    system_command "/usr/bin/open", args: ["#{appdir}/AI Usage.app"], must_succeed: false
  end

  zap trash: "~/Library/Preferences/local.ai-usage.plist"
end
