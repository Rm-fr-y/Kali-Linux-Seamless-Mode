Installing Seamless Mode in WSL -

Prerequisites:
Xlauncher/VcXsrv - https://sourceforge.net/projects/vcxsrv/ \
Desktop Coral - https://www.donationcoder.com/Software/Mouser/desktopcoral/downloads/DesktopCoralSetup.exe \
Kali WSL - https://www.kali.org/docs/wsl/wsl-preparations/

Step by Step Guide:

1. Open your Kali WSL installation and install Win-Kex (GUI for WSL).

2. Edit the Kex script to update the IP connection to Vcxrv (I edited to adjust for OpenVPN connections)

	1. Make sure to copy the script first -
	
		sudo cp /usr/bin/kex /usr/bin/kex.backup

	2. Adjust Kex IP address identification, find the line with

```
HOSTIP=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}')
#HOSTIP=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}')
```

  Comment out both of them, and adjust based on your configuration- \
  This is mine:

		# Smart VPN IP Extractor
		HOSTIP=$(/mnt/c/Windows/System32/ipconfig.exe | grep -A 10 "OpenVPN" | grep "IPv4 Address" | awk -F': ' '{print $2}' | tr -d '\r' | head -n 1)

		# Fallback if VPN is turned off
		if [ -z "$HOSTIP" ]; then
    			HOSTIP=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}')
		fi

3. Download the Bat script here and place it on your Desktop for quick access to Seamless Mode WSL and its functionality.

4. Download the config file for VcXsrv and put it in a location where you won't delete it. Adjust the bat script to have the correct location for the config file where it says "CONFIG FILEPATH HERE"

5. Download the Bash script here and place it in your WSL home directory ~/ (cd ~/).

6. Adjust the GDK and QT scales on the script to match your resolution.

	- The default is from my system which has a 2880 x 1620 resolution with a 200% scale in Windows. Do your research to determine the best configuration for your system.

7. Adjust the display settings for VcXsrv, this is a common configuration step if your Kali system is blurry at startup.

	1. Navigate to C:\Program Files\VcXsrv\ in file explorer.

	2. Right-click vcxsrv.exe and navigate to the Compatibility section, then select the Change High DPI Settings button.

	3. Check "Override high DPI scaling behavior" and make sure the Scaling is performed by Application.

8. Start Kali-Linux for the first time by double clicking the bat script on your Desktop.

9. Disable the full screen desktop that opens up during startup.

	1. Click the Dragon icon on the panel, and search for "Session and Startup".

	2. Navigate to the Current Session section and find xdesktop and make sure its restart setting is set to Never.

	3. Click the Save Session button.

10. Adjust the panel size for your display.

	1. Right click any blank space on the panel and hover over the "Panel" text

	2. Click on Panel Preferences

	3. Increase Row Size until you are satisfied with the result.

11. Exit the Seamless Mode by Alt-Tabbing to the open terminal and typing exit.

12. Adjust the .bat file to match the size you chose for the panel

	Change

		start "" "C:\Program Files (x86)\DesktopCoral\DesktopCoral.exe" -placement top -dockheight 50

	To

		start "" "C:\Program Files (x86)\DesktopCoral\DesktopCoral.exe" -placement top -dockheight PIXELCOUNT

13. Use the .bat script to open Kali again and enjoy!
