# removeStoryboardDynamically.sh — Automate Removing Main.storyboard from Your Xcode Project

Welcome to **removeStoryboardDynamically.sh**, the clean, simple, and fully automated shell script to help you completely remove `Main.storyboard` from your Xcode project. This script also cleans up all related settings in your project files and sets up your `SceneDelegate.swift` for a fully programmatic UI launch.  

***
Why Use removeStoryboard.sh?

- 💻 **Save time and avoid errors**: Automates storyboard removal steps that are usually manual and error-prone.
- 🗂 **Cleans up related settings**: Removes entries from `Info.plist`, `project.pbxproj` build settings, and updates your app lifecycle code.
- ⚙️ **Ready for programmatic UI**: Configures `SceneDelegate.swift` for launching your UI without storyboard.
- 🚀 **Easy to use**: Works for any Xcode project, just give it the project name or run it interactively.
- 🧹 **Safe and idempotent**: Contains checks to avoid errors if keys/files are already missing.

***
Before Running this Script Screenshot:
<img width="1400" height="846" alt="Screenshot 2025-08-11 at 11 35 11 AM" src="https://github.com/user-attachments/assets/7cf5c024-1f6f-45c7-93a7-7571829fd8c7" />

- Deletes the `Main.storyboard` file from your project folder.
- Removes `UIMainStoryboardFile` and related storyboard keys from `Info.plist`.
- Clears `INFOPLIST_KEY_UIMainStoryboardFile` from `project.pbxproj` build settings.
- Updates `SceneDelegate.swift` with clean, commented, programmatic UI setup code.
- Provides clear console output for each step with helpful status messages.

***

## Getting Started

### Prerequisites

- macOS with Xcode project
- Basic familiarity with terminal / shell scripting

### Usage

Clone or download this script **removeStoryboardDynamically.sh** into your project root folder. (parallel to your Xcode project)

Give execute permission to the script:

```bash
chmod +x removeStoryboardDynamically.sh
```

Run the script by passing your project name (without `.xcodeproj`):

```bash
./removeStoryboardDynamically.sh <MyProject>
```

Or run with no arguments to be prompted:

```bash
./removeStoryboardDynamically.sh
```

Enter your project name when asked, and let the script handle the rest!

***

## What Happens Behind the Scenes?

1. **Storyboard Removal**  
   Deletes `Main.storyboard` from your project’s `Base.lproj` folder.

2. **Info.plist Cleaning**  
   Removes `UIMainStoryboardFile` and iOS 13 Scene Manifest keys to prevent storyboard loading.

3. **Build Settings Update**  
   Clears the storyboard key in your Xcode project’s build settings file (`project.pbxproj`).

4. **SceneDelegate Setup**  
   Replaces your `SceneDelegate.swift` with a clean template that launches your initial view controller programmatically.

***

## Screenshots

_Run Script in Terminal:_

<img width="765" height="428" alt="Screenshot 2025-08-11 at 11 38 06 AM" src="https://github.com/user-attachments/assets/aaf7774a-bdee-43d6-a528-b04a44d6d5cc" />


_info.plist & Scene Delegate Code:_

<img width="1440" height="900" alt="Screenshot 2025-08-11 at 11 36 46 AM" src="https://github.com/user-attachments/assets/f772fe7f-513b-466b-b58d-a6d37ab87c4a" />

<img width="1440" height="900" alt="Screenshot 2025-08-11 at 11 42 16 AM" src="https://github.com/user-attachments/assets/c7764d8c-43ef-4012-b4c7-b9863404fc32" />

_Both Script and Project are parallely placed in the Root Folder:_

<img width="362" height="157" alt="Screenshot 2025-08-11 at 11 40 20 AM" src="https://github.com/user-attachments/assets/823a99b7-bd5a-44a9-8295-6cdfad464acc" />

Want to adjust the initial view controller or add more functionality? Edit the `SCENE_DELEGATE_CONTENT` variable inside the script where your Swift code is defined.

***

## Contributing

Feel free to open issues or submit pull requests to improve this script!

***

Crafted to make your transition to code-based UI in Xcode effortless and reliable! 🎉

***

*Happy Coding!* 🚀
