with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "mypage";
  src = ./.;
  installPhase = ''
    mkdir $out
    cp index.html $out/
    cp -r img $out/
  '';
}
