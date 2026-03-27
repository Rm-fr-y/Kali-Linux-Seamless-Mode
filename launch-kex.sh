#!/bin/bash

# --- 1. CLEANUP ---
kex stop > /dev/null 2>&1
rm -rf /tmp/.X11-unix > /dev/null 2>&1

# --- 2. LAUNCH ---
echo "Starting Win-KeX natively..."
kex --sl --sound

# --- 3. CONTROLLER MODE ---
echo "---------------------------------------------------"
echo "  KALI SEAMLESS DESKTOP IS RUNNING."
echo "  Type 'exit' and hit Enter to close everything."
echo "---------------------------------------------------"

/bin/bash

# --- 4. SHUTDOWN ---
echo "Shutting down..."
kex stop > /dev/null 2>&1

# Kill Windows Server AND DesktopCoral to return full screen real estate
taskkill.exe /IM DesktopCoral.exe /F > /dev/null 2>&1
taskkill.exe /IM vcxsrv.exe /F > /dev/null 2>&1
taskkill.exe /IM xlaunch.exe /F > /dev/null 2>&1

echo "Goodbye!"
sleep 1
