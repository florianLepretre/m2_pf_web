with import <nixpkgs>{};
( haskellPackages.callPackage ./hello.nix {} ).env
