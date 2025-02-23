# List of package names targeted for removal
# This list comprises unnecessary packages pre-installed on our devices that are not typically utilized by users in a traditional manner. Despite their lack of practical use, these packages may collect user data and potentially share or sell it to third parties.
# Removing all packages from this list poses no risk to the Android device. The device will continue to function normally and can be used without any issues following the removal process.
$apps = @(
    # BIXBY - THIS REMOVES EVERYTHING NECESARY TO RETAIN SOME FUNCTIONALITY
    "com.samsung.android.bixby.wakeup", # Bixby Wake-up Service
    "com.samsung.android.app.spage", # Samsung Bixby Home (Samsung App)
    "com.samsung.android.app.routines", # Bixby Routines (Automation App)
    "com.samsung.android.bixby.service", # Bixby Service (Core Bixby Functionality)
    "com.samsung.android.bixby.agent", # Bixby Voice Agent
    "com.samsung.android.bixby.agent.dummy", # Dummy Bixby Agent (Used for background functionality)
    "com.samsung.android.visionintelligence", # Bixby Vision
    
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


    # EDGE - People Edge and Edge-related Services
    "com.samsung.android.service.peoplestripe", # People Edge Service


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
    "com.samsung.android.samsungpay.gear",

    # SAMSUNG TIPS
    "com.samsung.android.app.tips",

    # SAMSUNG CALENDAR
    "com.samsung.android.calendar",

    # YOUTUBE - YouTube App
    "com.google.android.youtube", # YouTube App
    "com.google.android.apps.youtube.music", # YouTube Music

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
    "com.google.android.apps.messaging", # Google Messages

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