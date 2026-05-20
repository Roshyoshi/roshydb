{
  description = "roshydb C++26 Autotools project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.stdenv.mkDerivation {
            pname = "roshydb";
            version = "0.1.0";
            src = pkgs.lib.cleanSourceWith {
              src = ./.;
              filter = path: type:
                let
                  name = builtins.baseNameOf path;
                  parent = builtins.baseNameOf (builtins.dirOf path);
                  generatedNames = [
                    ".deps"
                    ".libs"
                    "Makefile"
                    "Makefile.in"
                    "aclocal.m4"
                    "autom4te.cache"
                    "build-aux"
                    "config.h"
                    "config.h.in"
                    "config.log"
                    "config.status"
                    "configure"
                    "libtool"
                    "result"
                    "stamp-h1"
                  ];
                in
                !(
                  builtins.elem name generatedNames
                  || pkgs.lib.hasSuffix ".la" name
                  || pkgs.lib.hasSuffix ".lai" name
                  || pkgs.lib.hasSuffix ".lo" name
                  || pkgs.lib.hasSuffix ".log" name
                  || pkgs.lib.hasSuffix ".o" name
                  || pkgs.lib.hasSuffix ".trs" name
                  || (parent == "m4" && name == "libtool.m4")
                  || (parent == "m4" && pkgs.lib.hasPrefix "lt" name && pkgs.lib.hasSuffix ".m4" name)
                  || (parent == "src" && name == "roshydb")
                  || (parent == "tests" && name == "roshydb_tests")
                );
            };

            nativeBuildInputs = with pkgs; [
              autoconf
              autoconf-archive
              automake
              libtool
              pkg-config
            ];

            buildInputs = with pkgs; [
              gtest
            ];

            preConfigure = ''
              sh ./bootstrap
            '';

            doCheck = true;
            enableParallelBuilding = true;
          };
        });

      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              autoconf
              autoconf-archive
              automake
              gnumake
              gtest
              libtool
              pkg-config
              stdenv.cc
            ];
          };
        });
    };
}
