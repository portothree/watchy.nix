{ pkgs ? import <nixpkgs> { } }:

let
  watchy-udev-rules = pkgs.stdenv.mkDerivation {
    name = "watchy-udev-rules";
    rules = pkgs.writeTextFile {
      name = "99-watchy-udev.rules";
      text = builtins.readFile ./misc/99-watchy-udev.rules;
    };
    buildCommand = ''
      mkdir -p $out/etc/udev/rules.d
      cp $rules $out/etc/udev/rules.d/99-watchy-udev.rules
    '';
  };
  fhs = pkgs.buildFHSUserEnv {
    name = "watchy-env";
    targetPkgs = pkgs:
      ((with pkgs; [ udev platformio avrdude ]) ++ [ watchy-udev-rules ]);
    runScript = "bash";
  };
in fhs.env
