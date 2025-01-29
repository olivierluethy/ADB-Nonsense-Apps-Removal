# Benutzerabfrage für das Löschen der Daten
$deleteData = Read-Host "Do you want to completely delete all app data? (y/n)"

# Bestimmen, ob das -k-Flag verwendet werden soll
if ($deleteData -eq 'y') {
    $uninstallFlag = ""
}
else {
    $uninstallFlag = "-k"
}

# List of package names to remove
$apps = @(
    # BIXBY - THIS REMOVES EVERYTHING NECESARY TO RETAIN SOME FUNCTIONALITY
    "com.samsung.android.bixby.wakeup", # Bixby Wake-up Service
    "com.samsung.android.app.spage", # Samsung Bixby Home (Samsung App)
    "com.samsung.android.app.routines", # Bixby Routines (Automation App)
    "com.samsung.android.bixby.service", # Bixby Service (Core Bixby Functionality)
    "com.samsung.android.bixby.agent", # Bixby Voice Agent
    "com.samsung.android.bixby.agent.dummy", # Dummy Bixby Agent (Used for background functionality)
    
    # FACEBOOK - Meta (Facebook) Apps
    "com.facebook.system", # Meta App Installer
    "com.facebook.appmanager", # Meta App Manager
    "com.facebook.services", # Meta Services
    "com.facebook.katana", # Facebook App
    
    # CAR MODE - Samsung Car Mode App
    "com.samsung.android.drivelink.stub", # Samsung's DriveLink Car Mode

    # SAMSUNG GAME LAUNCHER - Samsung's Gaming Hub & Related Apps
    "com.samsung.android.game.gamehome", # Gaming Hub
    "com.enhance.gameservice", # Game Service
    "com.samsung.android.game.gametools", # Game Tools
    "com.samsung.android.game.gos", # Game Optimization Service
    "com.samsung.android.gametuner.thin", # Game Tuner for Performance

    # SAMSUNG BROWSER - Samsung’s In-built Web Browser
    "com.sec.android.app.sbrowser", # Samsung Browser
    "com.samsung.android.app.sbrowseredge", # Samsung Browser Edge Features

    # GEAR VR - Virtual Reality Services
    "com.samsung.android.hmt.vrsvc", # Gear VR Service
    "com.samsung.android.app.vrsetupwizardstub", # VR Setup Wizard (Unused Stub)
    "com.samsung.android.hmt.vrshell", # Gear VR Shell
    "com.google.vr.vrcore", # Google VR Core

    # SAMSUNG KIDS - Samsung Kids Mode & Related Apps
    "com.samsung.android.kidsinstaller", # Samsung Kids Installer
    "com.samsung.android.app.camera.sticker.facearavatar.preload", # Camera Stickers for Kids

    # SAMSUNG LED COVER - Apps Related to Samsung’s LED Cover
    "com.samsung.android.app.ledbackcover", # LED Back Cover App
    "com.sec.android.cover.ledcover", # LED Cover Service

    # EDGE - People Edge and Edge-related Services
    "com.samsung.android.service.peoplestripe", # People Edge Service

    # SAMSUNG DEX - Samsung's Desktop Experience Mode
    "com.sec.android.desktopmode.uiservice", # Samsung Dex Service
    "com.samsung.desktopsystemui", # Desktop UI for Dex Mode
    "com.sec.android.app.desktoplauncher", # Dex Launcher

    # GENERAL SYSTEM - Miscellaneous System Apps and Services
    "com.dsi.ant.sample.acquirechannels", # ANT+ Channels
    "com.dsi.ant.service.socket", # ANT+ Service Socket
    "com.dsi.ant.server", # ANT+ Server
    "com.dsi.ant.plugins.antplus", # ANT+ Plugin for Devices
    "com.android.egg", # Hidden Easter Egg Game
    "com.sec.android.easyonehand", # Easy One Hand Mode
    "com.sec.android.widgetapp.samsungapps", # Samsung Apps Widget
    "com.sec.android.app.launcher", # Samsung One UI Home aka Samsung App Launcher
    "com.samsung.android.mateagent", # Samsung Device Management Agent
    "com.sec.android.easyMover.Agent", # Easy Mover (Data Transfer)
    "com.samsung.android.app.watchmanagerstub", # Samsung Watch Manager Stub
    "com.sec.android.daemonapp", # Samsung Daemon App
    "com.samsung.android.app.social", # Samsung Social Hub

    # GIMMICKY APPS - AR and Fun Apps
    "com.samsung.android.aremoji", # AR Emoji App
    "com.google.ar.core", # Google AR Core (Augmented Reality)
    "flipboard.boxer.app", # Flipboard App
    "com.samsung.android.wellbeing", # Samsung Wellbeing (Digital Wellbeing)
    "com.samsung.android.da.daagent", # Samsung's DA Agent
    "com.samsung.android.service.livedrawing", # Live Drawing Service
    "com.sec.android.mimage.avatarstickers", # Avatar Stickers (AR Emojis)
    "com.samsung.android.ardrawing", # AR Doodle
    "com.samsung.android.aremojieditor", # AR Emoji Editor
    "com.samsung.android.arzone", # AR Zone (AR Features)

    # PRINTING - Printer Services and Apps
    "com.android.bips", # BIPS Printing Service
    "com.google.android.printservice.recommendation", # Print Service Recommendation
    "com.android.printspooler", # Print Spooler Service

    # SAMSUNG PASS / PAY - Samsung’s Payment & Authentication Services
    "com.samsung.android.samsungpassautofill", # Samsung Pass Autofill
    "com.samsung.android.authfw", # Authentication Framework for Samsung
    "com.samsung.android.samsungpass", # Samsung Pass (Password Management)
    "com.samsung.android.spay", # Samsung Pay
    "com.samsung.android.spayfw", # Samsung Pay Framework
    "com.samsung.android.sdk.mobileservice", # Samsung Mobile Services SDK
    "com.samsung.android.digitalkey", # Digital Key Framework for Samsung Wallet

    # YOUTUBE - YouTube App
    "com.google.android.youtube", # YouTube App

    # NETFLIX - Netflix App and Services
    "com.netflix.mediaclient", # Netflix Media Client
    "com.netflix.partner.activation", # Netflix Partner Activation Service

    # SAMSUNG SECURE FOLDER - Samsung's Secure Folder Feature
    "com.samsung.knox.securefolder", # Samsung Secure Folder
    "com.samsung.android.scloud", # Samsung Cloud Assistant
    "com.samsung.android.mdx", # Samsung Core Services (MDX Service)
    
    # GOOGLE - Google Apps and Services
    "com.google.android.apps.googleassistant", # Google Assistant
    "com.android.chrome", # Google Chrome Browser
    "com.google.android.googlequicksearchbox", # Google App (Search)

    # SAMSUNG DICTIONARY - Samsung Dictionary App
    "com.diotek.sec.lookup.dictionary", # Samsung Dictionary

    # LIVE TRANSCRIBE - Accessibility Services for Transcription
    "com.google.audio.hearing.visualization.accessibility.scribe", # Live Transcribe & Sound Notifications

    # LANGUAGE PACKS - Language Packs for Samsung Apps
    "com.samsung.android.language.en_pt", # English-Portuguese Language Pack
    
    # GROUP SHARE - Group Sharing Service
    "com.samsung.android.groupshare", # Group Sharing Service

    # UPDAY - News Service
    "de.axelspringer.yana.zeropage"      # Upday (News App)
)

# Uninstall each app
foreach ($app in $apps) {
    Write-Host "Uninstalling $app..."
    adb shell pm uninstall $uninstallFlag --user 0 "$app"
}

Write-Host "Finished uninstalling the apps."
