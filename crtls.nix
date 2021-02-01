with import <nixpkgs> {};

let
  version = "1.0.0";
  rules = import ./rules.nix;
in
stdenv.mkDerivation {
  name = "devkitArmCrtls";
  buildInputs = [gcc-arm-embedded rules];

  src = fetchTarball {
    url = https://github.com/devkitPro/devkitarm-crtls/archive/v1.0.0.tar.gz;
    sha256 = "1mnx79riaraz1n3gppcrq0mdr0b125lh34lq5xj1mgn55d6vrmmp";    
  };

  patches = [ ./crtls-makefile.patch ];

  DEVKITARM = rules;

  installPhase = ''
     DESTDIR="$out" make install
  '';

  dontPatchELF = true;
  dontStrip = true;
}
