{ inputs, self, ... }:
{
  perSystem =
    { pkgs
    , inputs'
    , self'
    , system
    , lib
    , config
    , ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.nixpkgs-fmt
          pkgs.terraform
          pkgs.nodejs
          pkgs.nodePackages.npm
          pkgs.typescript-language-server
          pkgs.svelte-language-server
          pkgs.cabal-install
          pkgs.ghc
        ];
        shellHook = ''
        '';
      };

    };
}
