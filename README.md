Add files via upload
This script showcases the use of if elif else commands - along with echo, read (for input) bluetoothctl options and the use of storing string in variables

The script does the folllowing....

Checks for paired devices mac addresses that are already connected

Attempts to connect for 1 mac address stored in the BTD variable (if it's found within the grep search / filter)

If nothing's found - it will prompt you to enter a MAC address from the previously listed addresses and attempt to connect to the device.


-------------------------------------------

For auto-connecting BT devices - change the BTD variable to a known MAC address

-------------------------------------------

I've also attached the .desktop file used for running the scripts on startup - create and store (For ubuntu users) in ~/.config/autostart/ and edit the script path to match your parameters.

ENJOY!
