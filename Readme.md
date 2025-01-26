### **Introduction to ADB (Android Debug Bridge)**

**ADB** (Android Debug Bridge) is a versatile command-line tool used for managing Android devices and emulators. It allows you to interact with your Android device from a computer, enabling you to perform a wide range of tasks like installing and uninstalling apps, debugging, copying files, and even accessing the device’s shell.

ADB is an essential tool for developers, advanced users, and enthusiasts who want to manage their Android devices beyond what is offered by the standard user interface.

### **Why this project**

> You pay for a device which you can't really control

There are so many preinstalled apps on every phone that are completely unnecessary and don't want to be on your phone anymore. If you have Netflix, YouTube or Google, try to uninstall them ... Well, you can't. You can only disable them, but that doesn't mean they've been removed from your phone. They can still do stuff, and that's what this project is all about. You can check which apps you don't want anymore and remove them intuitively.

### **Prerequesits**

You only need your android based phone and a computer.
Note: It is not required to root your mobile device!

### **What You Can Do with ADB**

ADB provides access to several powerful commands that allow you to:

- **Install and Uninstall Apps**: You can install apps from your computer to the Android device, or uninstall apps directly from the device.
- **List Installed Apps**: You can view a list of all apps installed on the device.
- **Access Device Shell**: You can interact with the Android device's operating system directly via a command-line interface.
- **File Management**: You can copy files to and from your Android device.
- **Debugging**: ADB can be used to debug apps and monitor device logs.

### **Setting Up ADB on Windows**

Before you can use ADB on your Windows computer, you need to install **ADB tools** and set up your device for communication.

1. **Install ADB Tools**:
   - Download and install **[ADB](https://developer.android.com/tools/releases/platform-tools?hl=de)** from the official **Android Developer website** or use a package manager like **Chocolatey** on Windows.
   
2. **Enable USB Debugging on your Android device**:
   - On your Android device, go to **Settings > About phone**, tap **Build number** 7 times to unlock Developer options.
   - Then, go to **Settings > Developer options** and enable **USB Debugging**.

3. **Connect the Device via USB**:
   - Connect your Android device to your computer via a USB cable.
   - Allow USB debugging on your phone if prompted.

If you have this, go an checkout this video here for how you can add ADB as you environment variables in windows.
YouTube Prompt: how to install adb on windows
[Setup Guide 1 recommended](https://www.youtube.com/watch?v=I_W7pzpB09M)

YouTube Prompt: android adb tool
[Setup Guide 2 more detailed](https://youtu.be/GERlhgCcoBc?si=BprpICH6d4HKPjNT)


### **List All Installed Apps and Store in a `.txt` File**

Now, let’s explore how you can **list all installed apps** on your Android device and **store the list in a `.txt` file**.

#### **Listing Installed Apps**

1. **Open Windows PowerShell or Command Prompt**:
   - You can either use **PowerShell** or **Command Prompt** to execute ADB commands.

2. **Run the Following Command to List All Apps**:

   ```bash
   adb shell pm list packages --user 0
   ```

   This command will list all the package names of apps installed on your Android device. You can filter the list for user apps or system apps with specific flags:
   
   - To list **only user apps**:
     ```bash
     adb shell pm list packages -3 --user 0
     ```
   
   - To list **only system apps**:
     ```bash
     adb shell pm list packages -s --user 0
     ```

3. **Store the List in a `.txt` File**:
   
   To save the list of installed apps into a text file, you can redirect the output to a `.txt` file like so:
   
   ```bash
   adb shell pm list packages > C:\path\to\your\file\installed_apps.txt
   ```

   This will save the list of installed apps to `installed_apps.txt` on your computer.
   That way it's much easier to filter and look for apps you might not want to have on your phone.

#### **Uninstall Apps Using ADB**

To uninstall apps via ADB, use the following command:

```bash
adb shell pm uninstall --user 0 com.example.package
```

Replace `com.example.package` with the actual package name of the app you want to remove. You can find the package names from the output of the list command above.

You can also use a script to uninstall multiple apps at once. Example:

```bash
adb shell pm uninstall --user 0 com.example.package1
adb shell pm uninstall --user 0 com.example.package2
```

### **Setting PowerShell Execution Policy to Allow Scripts**

By default, Windows PowerShell may block the execution of scripts for security reasons. To allow PowerShell scripts to run, you need to modify the execution policy:

1. **Open PowerShell as Administrator**:
   - Right-click on **PowerShell** and select **Run as Administrator**.

2. **Set the Execution Policy**:
   To allow running scripts, set the execution policy to **RemoteSigned**:

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

   - **RemoteSigned** allows you to run scripts written on your computer but requires downloaded scripts to be signed by a trusted publisher.

3. **Confirm the Change**:
   You will be prompted to confirm the change. Type `Y` to confirm.

### **Running the PowerShell Script**

Once the execution policy is set, you can create and run a PowerShell script to list or uninstall apps. Here’s a simple script for listing and saving apps:

#### **PowerShell Script Example**:

To run the powershell script, you just need to copy and paste the entire script into the input field. Make sure to use **Windows PowerShell ISE** and not **Windows PowerShell** as this wouldn't contain a big input field to enter the script you want to run.

### **How to install apk on your phone if you have accidentally removed myfiles from your phone**

Example with Samsung Galaxy Store.

1. **Go to google and search for APK name**:
```
samsung galaxy store apk
```

2. **Download APK on your computer**:

Download Link of [APKMirror](https://www.apkmirror.com/apk/samsung-electronics-co-ltd/galaxy-apps/galaxy-apps-4-5-88-5-release/samsung-galaxy-store-galaxy-apps-4-5-88-5-android-apk-download/download/?key=96e5f913bf7c74402d389d2ebc34aa22145665ad)

Rename the file and give it a simpler name like:

```bash
com.sec.android.app.samsungapps.apk
```

3. **Create folder inside Documents and put APK inside**:
It's not recommended to put it inside of Downloads as it's difficult to access it from there. So, just put everything inside of Documents.

4. **Put the file from your computer to phone**:

```bash
adb push "C:\Users\[username]\Documents\Samsung Store\com.sec.android.app.samsungapps.apk" /data/local/tmp/
```

4. **Access file stored in phone and run it**:
adb shell pm install /data/local/tmp/com.sec.android.app.samsungapps.apk

### **Conclusion**

ADB is a powerful tool that enables you to manage Android devices efficiently. You can list and uninstall apps, as well as perform a variety of other tasks, all through simple commands. Setting up ADB is quick and allows you to interact with your device directly from your computer. You can use PowerShell to automate tasks and manage your apps, and you can change the execution policy on Windows to allow running scripts.

If you follow the steps outlined above, you’ll be able to list all apps on your device and uninstall any unnecessary ones, all while saving the data in a `.txt` file for reference.