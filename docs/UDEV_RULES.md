# udev rules

We need to install udev rules for PlatformIO supported boards/devices.
You can find the necessary rules in the `misc` folder.

After installing the udev rules, we need to restart the udev management tool:

```
sudo udevadm control --reload-rules
sudo udevadm trigger
```
