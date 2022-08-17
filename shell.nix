{ pkgs ? import <nixpkgs> { } }:

let
  udevRules = ./misc/watchy-usb.rules;
  fhs = pkgs.buildFHSUserEnv {
    name = "watchy-usb";
    targetPkgs = pkgs: (with pkgs; [ platformio avrdude ]);
    extraInstallCommands = ''
      install -D ${udevRules} /etc/udev/rules.d/50-watchy-usb.rules
    '';
    runScript = "bash";
  };
in fhs.env
