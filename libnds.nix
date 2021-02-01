with import <nixpkgs> {};

let
  crtls = import ./crtls.nix;
  rules = import ./rules.nix;
  grit = import ./grit.nix;
in
stdenv.mkDerivation {
  buildInputs = [gcc-arm-embedded grit newlib glib binutils gdb libmpc];
  
  name = "libnds";
  src = fetchFromGitHub {
    owner = "devkitPro";
    repo = "libnds";
    rev = "154a21cc3d57716f773ff2b10f815511c1b8ba9f";
    sha256 = "063w3mrnr7c1l1nz2149952y6r1gnfl054n3k82p1719p3nhbxxk";
  };
  
  DEVKITARM = rules;
  DEVKITPRO = "${crtls}/bin";  
}
