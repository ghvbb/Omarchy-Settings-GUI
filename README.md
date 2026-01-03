**Omarchy-Settings-GUI**
it's an new modern app that let you  Change Settings of Hyprland config files With GUI App 
Open-Source 100%
---

## How to Run the App

1. **Clone the repository**

```bash
git clone --depth 1 https://github.com/ghvbb/Omarchy-Settings-GUI.git
```

2. **Change to the app directory**

```bash
cd Omarchy-Settings-GUI
```

3. **Install the app**
   You have two options:

   * **Option 1: Using the `.desktop` file**
     Copy `omarchy-settings.desktop` to:

     ```text
     /home/mohamedxa/.local/share/applications
     ```

   * **Option 2: Using the installer script**
     Run the included script:

     ```bash
     sh ohmyinstall.sh
     ```

4. **.desktop file example**
   Make sure your `.desktop` file looks like this:

```ini
[Desktop Entry]
Type=Application
Name=Omarchy Settings
Comment=Liquid Glass Configuration Manager for Hyprland
Exec=python3 ~/.config/hypr/omarchy-control.py
Icon=preferences-system
Categories=Settings;System;
Terminal=false
```

5. **Save and launch**
   After saving the `.desktop` file or running the installer script, you’re done! You can now launch **Omarchy Settings** from your application menu.

---

The Goal :
the new goal is to make it work for  TUI (Comming Soon)
