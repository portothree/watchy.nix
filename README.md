# Watchy.nix

## Requirements

- [Watchy](https://watchy.sqfmi.com/)
- Nix >= 2.4
	- PlatfomIO >= 5.0

## Upload a new Watchy face

Plug-in your Watchy, compile and then upload the face:

```
pio run -t upload -d examples/faces/dos
```

Watch the serial port output

```
pio device monitor
```
