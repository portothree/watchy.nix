# Watchy.nix

## Requirements

- [Watchy](https://watchy.sqfmi.com/)
- Nix >= 2.4
	- PlatfomIO >= 5.0

## Examples

### Upload a new Watchy face

Enter development shell with dependencies installed:

```
nix develop
```

Plug-in your Watchy, compile and then upload the DOS example face:

```
pio run -t upload -d examples/faces/dos -c platformio.ini
```


## Debug

Watch the serial port output:

```
pio device monitor
```
