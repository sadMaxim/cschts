{ inputs, self, ... }:
{
  perSystem = { system, inputs', pkgs, self', ... }:
    {
      packages.web =  pkgs.stdenv.mkDerivation {
          name = "web";
          nativeBuildInputs = [
            pkgs.nodejs
          ];
          buildPhase = ''
          '';
          installPhase = ''
          '';
        };
  };
}

