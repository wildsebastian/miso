{ pkgs ? import <nixpkgs> {} }:
let
  inherit (pkgs.haskell.packages) ghcjsHEAD;
in { miso-release = (import ./default.nix { inherit pkgs; }).release;
     miso-ghcjs8 = (ghcjsHEAD.override {
       overrides = self: super: {
         jsaddle-warp = super.callPackage ./jsaddle-warp-ghcjs.nix {};
       };
     }).callPackage ./miso-ghcjs.nix { };
     haskell-miso.org = import ./examples/haskell-miso.org { inherit pkgs; };
     sse-example = import ./examples/sse { inherit pkgs; };
   }
