WinBoat One-Click Launcher (Post-Installation) by BluegrassKenpunkian


===Overview===

This is a basic shell script and desktop launcher designed for users on Debian-based Linux systems who need a fast, one-click solution to start WinBoat from their desktop environment.

This solution assumes you have already completed the complex steps of installing Docker and Docker Compose V2. Its primary function is to verify your permissions and correctly execute the WinBoat AppImage.

==Project Files==

    winboat-launcher.sh: The shell script that executes the AppImage and verifies permissions.

    WinBoat Launcher.desktop: The file that creates the clickable icon on your desktop.

===Essential Assumptions===

This launcher will not install Docker or Docker Compose V2. It assumes these foundational steps are already complete and relies on the following two conditions being met:

    Dependencies Installed: Docker and Docker Compose V2 are installed on your system.

    Permissions Active: Your current user has been added to the docker group and you have logged out and logged back in to activate the permissions.



=== Installation and Setup ===

Follow these steps to deploy the one-click launcher:


Step 1: Place the WinBoat AppImage

The launcher is configured to look for the WinBoat AppImage in a specific location: ~/Virtualizations/winboat.AppImage.

    Create the required directory if it doesn't exist:
    Bash

    mkdir -p ~/Virtualizations

    Place your downloaded winboat.AppImage into this directory.



Step 2: Place the Launcher Script

Move the winboat-launcher.sh file into your home directory (~).
Bash

mv /path/to/downloaded/winboat-launcher.sh ~/



Step 3: Set Permissions for the Script

The script must be executable:
Bash

chmod +x ~/winboat-launcher.sh



Step 4: Deploy the Desktop Launcher

Move the WinBoat Launcher.desktop file to your Desktop folder:
Bash

mv /path/to/downloaded/WinBoat\ Launcher.desktop ~/Desktop/



Step 5: Trust and Launch

On your desktop, you may need to right-click the new icon and select "Allow Launching" or "Mark as Executable" before it will run. Double-click to launch!



===Script Logic Highlights===

The winboat-launcher.sh script focuses on robustness during execution:

    It first uses the groups command to ensure the user is an active member of the docker group. If not, it prints a clear error message and exits before attempting to run Docker commands, preventing confusing permission denial errors.

    It automatically checks for and sets the executable bit (chmod +x) on the winboat.AppImage file, ensuring it always launches correctly.

    It runs the launch command in the foreground, allowing the user to see any diagnostic output within the terminal window.
