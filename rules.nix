with import <nixpkgs> {};

let
  version = "1.0.0";
in
stdenv.mkDerivation {
  name = "devkitArmRules";

  src = fetchTarball {
    url = "https://github.com/devkitPro/devkitarm-rules/archive/v${version}.tar.gz";
    sha256 = "177jw8sda2xn95cbparvy21picinnx7fdsrvhpr1y2k4kz31x6gy";
  };
  patches = [./rules-makefile.patch];
  
  installPhase = ''
     DESTDIR="$out" make install
  '';
}
