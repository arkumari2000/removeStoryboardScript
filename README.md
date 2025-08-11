# removeStoryboard.sh — Automate Removing Main.storyboard from Your Xcode Project

Welcome to **removeStoryboardDynamically.sh**, the clean, simple, and fully automated shell script to help you completely remove `Main.storyboard` from your Xcode project. This script also cleans up all related settings in your project files and sets up your `SceneDelegate.swift` for a fully programmatic UI launch.  

***
<img width="545" height="342" alt="Screenshot 2025-08-11 at 11 25 46 AM" src="https://github.com/user-attachments/assets/96f19d06-576a-404d-8a96-0b937d645a6c" />

Why Use removeStoryboard.sh?

- 💻 **Save time and avoid errors**: Automates storyboard removal steps that are usually manual and error-prone.
- 🗂 **Cleans up related settings**: Removes entries from `Info.plist`, `project.pbxproj` build settings, and updates your app lifecycle code.
- ⚙️ **Ready for programmatic UI**: Configures `SceneDelegate.swift` for launching your UI without storyboard.
- 🚀 **Easy to use**: Works for any Xcode project, just give it the project name or run it interactively.
- 🧹 **Safe and idempotent**: Contains checks to avoid errors if keys/files are already missing.

***
<img width="1432" height="467" alt="Screenshot 2025-08-11 at 11 28 17 AM" src="https://github.com/user-attachments/assets/44385586-d439-4728-a569-785a824c5927" />

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

<img width="526" height="334" alt="Screenshot 2025-08-11 at 11 29 21 AM" src="https://github.com/user-attachments/assets/dffc9379-453a-422e-b5cb-3eaccd8770cb" />

_Scene Delegate Code:_

<img width="1440" height="621" alt="Screenshot 2025-08-11 at 11 29 32 AM" src="https://github.com/user-attachments/assets/009b6f48-62ad-4750-ad21-a77d20e17903" />

_Both Script and Project are parallely placed in the Root Folder:_

<img width="274" height="146" alt="Screenshot 2025-08-11 at 11 30 32 AM" src="https://github.com/user-attachments/assets/5a01b77c-91a1-4b72-bf38-52fef52d0335" />

Want to adjust the initial view controller or add more functionality? Edit the `SCENE_DELEGATE_CONTENT` variable inside the script where your Swift code is defined.

***

## Contributing

Feel free to open issues or submit pull requests to improve this script!

***

Crafted to make your transition to code-based UI in Xcode effortless and reliable! 🎉

***

*Happy Coding!* 🚀
