with import <nixpkgs> {};

stdenv.mkDerivation {
  buildInputs = [ gcc-arm-embedded freeimage ];
  nativeBuildInputs = [ autoreconfHook ];
  name = "grit";
  src = fetchFromGitHub {
    owner = "devkitPro";
    repo = "grit";
    rev = "247c8b18155faf24a04221d8ae3d15fe715babd7";
    sha256 = "08pmxrn8accm32qcbj17csb28j4fnxjdvjs358ryzh19qs1gsdw9";
  };
}
