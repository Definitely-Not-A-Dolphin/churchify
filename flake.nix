{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cargo
          clippy
          rust-analyzer
          rustfmt
          rustc
        ];

        env.RUST_SRC_PATH = pkgs.rust.packages.stable.rustPlatform.rustLibSrc;
      };

      packages.${system}.default = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
        pname = "churchify";
        version = "0.1.0";

        src = pkgs.fetchFromGitHub {
          owner = "Definitely-Not-A-Dolphin";
          repo = "churchify";
          tag = finalAttrs.version;
          hash = "sha256-gyWnahj1A+iXUQlQ1O1H1u7K5euYQOld9qWm99Vjaeg=";
        };

        cargoHash = "sha256-9atn5qyBDy4P6iUoHFhg+TV6Ur71fiah4oTJbBMeEy4=";

        meta = {
          description = "Encode text Keygen Church-style";
          homepage = "https://github.com/Definitely-Not-A-Dolphin/churchify";
          license = pkgs.lib.licenses.unlicense;
          maintainers = [ ];
        };
      });
    };
}
