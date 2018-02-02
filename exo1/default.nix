
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "hello";
  src = ./.;
  buildInputs = [cmake];
}
