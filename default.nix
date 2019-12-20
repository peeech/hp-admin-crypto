{ pkgs ? import ./pkgs.nix {} }:

with pkgs;

let
  inherit (rust.packages.nightly) rustPlatform;
  inherit (darwin.apple_sdk.frameworks) Security;
in

{
  hp-admin-crypto-server = buildRustPackage rustPlatform {
    name = "hp-admin-crypto-server";
    src = gitignoreSource ./.;
    cargoDir = "server";

    buildInputs = lib.optionals stdenv.isDarwin [ Security ];
  };

  hp-admin-keypair = buildRustPackage rustPlatform {
    name = "hp-admin-keypair";
    src = gitignoreSource ./.;
    cargoDir = "client";

    nativeBuildInputs = with buildPackages; [
      nodejs
      pkgconfig
      (wasm-pack.override { inherit rustPlatform; })
    ];

    #buildInputs = [ openssl ];
    buildPhase = ''
      bash build.sh
    '';

    installPhase = ''
      mv pkg $out
    '';

    doCheck = false;
  };
}
