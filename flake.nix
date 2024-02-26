{
  description = "facebook segment anything model flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, utils}:
    let
      segment_anything_overlay = final: prev: {
        segment_anything = final.callPackage ./default.nix { };
      };
      my_overlays = [ segment_anything_overlay ];
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ self.overlays.default ];
      };
    in
    {
      overlays.default = nixpkgs.lib.composeManyExtensions my_overlays;

      packages.x86_64-linux =
        rec {
          segment_anything = pkgs.segment_anything ;
          default = segment_anything;
        };

    }

}