{ pkgs ? import <nixpkgs> {} }:
let
  _hello = pkgs.haskellPackages.callPackage ./hello.nix {};
in
pkgs.stdenv.mkDerivation {
  name = "hello";
  src = ./.;
  buildInputs = [ _hello ];
  installPhase = ''
    mkdir $out
    cp *.html $out/
    cp ${_hello}/bin/*.cgi $out/
  '';
}
