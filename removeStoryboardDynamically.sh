#!/bin/bash
# ==========================================================
# Script Name : removeStoryboardDynamically.sh
# Purpose     : Remove Main.storyboard from an Xcode project,
#               clean up build settings, Info.plist, and
#               configure SceneDelegate for programmatic UI.
# Usage       : 
#     ./removeStoryboardDynamically.sh <ProjectName>
#     ./removeStoryboardDynamically.sh           # prompts for name
# Example     :
#     ./removeStoryboardDynamically.sh Tasky
# Author     : Archana Kumari
# ==========================================================

# -------------------------------
# 1. GET PROJECT NAME FROM USER
# -------------------------------
if [[ -z "$1" ]]; then
    read -p "Enter Xcode project name (without .xcodeproj extension): " PROJECT_NAME
else
    PROJECT_NAME="$1"
fi

# Validate that the Project exists
if [[ ! -d "$PROJECT_NAME" ]]; then
    echo "❌ Project '$PROJECT_NAME' not found in current directory."
    exit 1
fi

# -------------------------------
# 2. DEFINE PATHS BASED ON PROJECT NAME
# -------------------------------
PROJECT_PATH="$PROJECT_NAME/$PROJECT_NAME"
STORYBOARD_FILE="$PROJECT_PATH/Base.lproj/Main.storyboard"
INFO_PLIST="$PROJECT_PATH/Info.plist"
PBXPROJ_FILE="$PROJECT_NAME.xcodeproj/project.pbxproj"
SCENE_DELEGATE_FILE="$PROJECT_PATH/SceneDelegate.swift"

echo "===== Processing project: $PROJECT_NAME ====="

# -------------------------------
# 3. DELETE MAIN.STORYBOARD FILE
# -------------------------------
if [ -f "$STORYBOARD_FILE" ]; then
    rm "$STORYBOARD_FILE"
    echo "✅ Deleted file: $STORYBOARD_FILE"
else
    echo "ℹ️  Main.storyboard not found — skipping delete."
fi

# -------------------------------
# 4. REMOVE STORYBOARD REFERENCES FROM INFO.PLIST
# -------------------------------
echo "===== Cleaning Info.plist ====="

/usr/libexec/PlistBuddy -c "Print :UIMainStoryboardFile" "$INFO_PLIST" &>/dev/null
if [[ $? -eq 0 ]]; then
    echo "🗑 Removing :UIMainStoryboardFile from Info.plist..."
    /usr/libexec/PlistBuddy -c "Delete :UIMainStoryboardFile" "$INFO_PLIST"
else
    echo "ℹ️  UIMainStoryboardFile not found in Info.plist."
fi

# Remove Storyboard Name key in Scene Manifest (iOS13+)
PLIST_SCENE_KEY=":UIApplicationSceneManifest:UISceneConfigurations:UIWindowSceneSessionRoleApplication:0:UISceneStoryboardFile"
/usr/libexec/PlistBuddy -c "Print $PLIST_SCENE_KEY" "$INFO_PLIST" &>/dev/null
if [[ $? -eq 0 ]]; then
    echo "🗑 Removing Storyboard Name from Scene Manifest..."
    /usr/libexec/PlistBuddy -c "Delete $PLIST_SCENE_KEY" "$INFO_PLIST"
else
    echo "ℹ️  Scene Manifest storyboard key not found."
fi

# -------------------------------
# 5. UPDATE .pbxproj FILE (Build Settings)
# -------------------------------
echo "===== Updating .pbxproj ====="
# macOS sed requires -i '' for in-place editing without backups
sed -i '' 's/INFOPLIST_KEY_UIMainStoryboardFile *= *"Main"/INFOPLIST_KEY_UIMainStoryboardFile = ""/g' "$PBXPROJ_FILE"
sed -i '' 's/INFOPLIST_KEY_UIMainStoryboardFile *= *Main;/INFOPLIST_KEY_UIMainStoryboardFile = "";/g' "$PBXPROJ_FILE"
echo "✅ Cleared storyboard reference from build settings."

# -------------------------------
# 6. UPDATE SCENEDELEGATE.SWIFT
# -------------------------------
echo "===== Updating SceneDelegate.swift ====="
read -r -d '' SCENE_DELEGATE_CONTENT << 'EOM'
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        // Ensure we have a valid UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Create a new window for the scene
        window = UIWindow(windowScene: windowScene)

        // Set the initial root view controller
        let viewController = ViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called when the scene is released by the system
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Restart any tasks that were paused
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Sent when moving from active to inactive state
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as part of transitioning from background to foreground
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as part of transitioning from foreground to background
    }
}
EOM

# Overwrite SceneDelegate.swift
echo "$SCENE_DELEGATE_CONTENT" > "$SCENE_DELEGATE_FILE"
echo "✅ SceneDelegate.swift updated with programmatic UI setup."

# -------------------------------
# 7. DONE
# -------------------------------
echo "🎉 Storyboard removed successfully from '$PROJECT_NAME'."
echo "   Open your project in Xcode, clean (Cmd+Shift+K), and run."
