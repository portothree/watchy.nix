{ pkgs ? import <nixpkgs> { } }:

let
  watchy-usb-rules = pkgs.stdenv.mkDerivation {
    name = "watchy-usb-rules";
    rules = pkgs.writeTextFile {
      name = "50-watchy-usb-rules.rules";
      text = builtins.readFile ./misc/watchy-usb.rules;
    };
    buildCommand = ''
      mkdir -p $out/etc/udev/rules.d
      cp $rules $out/etc/udev/rules.d/50-watchy-usb.rules
    '';
  };
  fhs = pkgs.buildFHSUserEnv {
    name = "watchy-usb";
    targetPkgs = pkgs:
      ((with pkgs; [ udev platformio avrdude ]) ++ [ watchy-usb-rules ]);
    runScript = "bash";
  };
in fhs.env
