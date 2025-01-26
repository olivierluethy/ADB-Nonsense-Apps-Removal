# List of package names to remove
$apps = @(
    "com.samsung.android.arzone",             # AR Zone (AR-related apps)
    "com.samsung.android.app.spage",          # Samsung Bixby Home (Samsung App)
    "com.samsung.android.ardrawing",          # AR Doodle
    "com.samsung.android.aremoji",            # AR Emoji
    "com.samsung.android.aremojieditor",      # AR Emoji Editor
    "com.sec.android.mimage.avatarstickers",  # AR Emoji Stickers
    "com.samsung.android.visionintelligence", # Bixby Vision
    "com.samsung.android.bixby.agent",        # Bixby Voice
    "com.google.android.youtube",             # YouTube
    "com.netflix.mediaclient",                # Netflix
    "com.netflix.partner.activation",
    "com.samsung.knox.securefolder",          # Samsung Secure Folder
    "com.samsung.android.bixbyvision.framework", # BixbyVision Framework
    "com.samsung.android.scloud",             # Samsung Cloud Assistant
    "com.samsung.android.mdx",               # Samsung Core Services (MDX service)
    "com.samsung.android.kidsinstaller",     # Samsung Kids
    "com.samsung.android.spayfw",            # Samsung Pay Framework
    "com.samsung.android.sdk.mobileservice", # Samsung Wallet Digital Key
    "com.google.android.apps.googleassistant", # Google Assistant
    "com.android.chrome",                    # Chrome Browser
    "com.diotek.sec.lookup.dictionary",      # Dictionary App
    "com.google.android.googlequicksearchbox", # Google App
    "com.google.audio.hearing.visualization.accessibility.scribe", # Live Transcribe and Sound Notifications
    "com.facebook.system",                   # Meta App Installer
    "com.facebook.appmanager",               # Meta App Manager
    "com.facebook.services",                 # Meta Services
    "com.samsung.android.authfw",            # Authentication Framework
    "com.samsung.android.digitalkey",         # Digital Key Framework
    "com.samsung.android.language.en_pt",    # En-Pt Language Pack
    "com.samsung.android.game.gamehome",     # Gaming Hub
    "com.samsung.android.groupshare"         # Group Sharing
    # Samsung Galaxy Store and MyFiles are excluded from removal to prevent issues
)

# Uninstall each app
foreach ($app in $apps) {
    Write-Host "Uninstalling $app..."
    adb shell pm uninstall --user 0 "$app"
}

Write-Host "Finished uninstalling the apps."
