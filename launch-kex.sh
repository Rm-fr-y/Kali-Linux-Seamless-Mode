#!/bin/bash

# --- 1. CONFIGURATION ---
export GDK_SCALE=1
export GDK_DPI_SCALE=1.5
export QT_SCALE_FACTOR=1.5

# --- 2. CLEANUP ---
kex stop > /dev/null 2>&1
rm -rf /tmp/.X11-unix > /dev/null 2>&1

# --- 3. LAUNCH ---
echo "Starting Win-KeX natively..."
kex --sl --sound

# --- 4. CONTROLLER MODE ---
echo "---------------------------------------------------"
echo "  KALI SEAMLESS DESKTOP IS RUNNING."
echo "  Type 'exit' and hit Enter to close everything."
echo "---------------------------------------------------"

/bin/bash

# --- 5. SHUTDOWN ---
echo "Shutting down..."
kex stop > /dev/null 2>&1

# Kill Windows Server AND DesktopCoral to return full screen real estate
taskkill.exe /IM DesktopCoral.exe /F > /dev/null 2>&1
taskkill.exe /IM vcxsrv.exe /F > /dev/null 2>&1
taskkill.exe /IM xlaunch.exe /F > /dev/null 2>&1

echo "Goodbye!"
sleep 1
