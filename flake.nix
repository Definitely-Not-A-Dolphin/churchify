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
          hash = "sha256-9TcZCTXVOWZ9e6XFs8yaScSnC7vvo/5s//zxPgUk1oY=";
        };

        cargoHash = "sha256-W/4fia2hV9H6qamh23sO+YH5nhdlEsHGHSC6Ovnez7A=";

        meta = {
          description = "Encode text Keygen Church-style";
          homepage = "https://github.com/Definitely-Not-A-Dolphin/churchify";
          license = pkgs.lib.licenses.unlicense;
          maintainers = [ ];
        };
      });
    };
}
