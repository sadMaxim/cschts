{ inputs, self, ... }:
{
  perSystem = { system, inputs', pkgs, self', ... }:
    {
    packages.web =  pkgs.buildNpmPackage {
            name = "${packageJSON.name}-site-${version}";
            version = packageJSON.version;
            src = gitignoreSource ./.;
            packageJson = "${src}/package.json";
            yarnLock = "${src}/yarn.lock";
            buildPhase = ''
              yarn --offline build
            '';
            distPhase = "true";
          };
  };
}

