{ pkgs ? import <nixpkgs> { } }:

let udevRules = ./misc/watchy-usb.rules;
in pkgs.mkShell {
  buildInputs = with pkgs; [ platformio ];
  shellHook = ''
    install -D ${udevRules} /etc/udev/rules.d/50-watchy-usb.rules
  '';
}
