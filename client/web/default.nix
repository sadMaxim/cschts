{ inputs, self, ... }:
{
  perSystem = { system, inputs', pkgs, self', ... }:
    {

  packages.web = pkgs.stdenv.mkDerivation {
    pname = "page-sveltekit-app";
    version = "1.0.0";
    src = ./.;
    nativeBuildInputs = [ pkgs.nodejs pkgs.nodePackages.npm ];
    buildPhase = ''
      export HOME=$(mktemp -d) 
      npm install
      # npm run build
    '';
    installPhase = ''
      mkdir -p $out
      cp -r build $out/
    '';

    dontUseNodeModules = true;
    meta = {
      description = "A SvelteKit project built with npm";
      license = pkgs.lib.licenses.mit;
    };
  };

   packages.web1 =  inputs.napalm.legacyPackages.${system}.buildPackage ./. { 
      nodejs = pkgs.nodejs;
      postNpmHook = ''
        npm install
        npm run build
      '';
     };
   packages.web = 
      let
        _name = "web-preview";
      in
      pkgs.buildNpmPackage {
        pname = "${_name}";
        version = "0.0.0";
        src = ./.;

        npmDepsHash = "sha256-k9vvN/6B/IFXnzEnBRk3RIzKfNHFGC4YzvUPxiCXoHE=";

        # Let buildNpmPackage run `npm run build`
        installPhase = ''
          mkdir -p "$out/bin" "$out/lib"
          cp -rv .svelte-kit build node_modules package.json vite.config.* svelte.config.* "$out/lib"
          cat > "$out/bin/${_name}" << EOF
          #!${pkgs.runtimeShell}
          cd "$out/lib"
          exec ${pkgs.nodejs}/bin/node build 
          EOF

          chmod +x "$out/bin/${_name}"
          '';
      };

    };
   
}


          # cp -rv .svelte-kit build node_modules package.json vite.config.* svelte.config.* "$out/lib"
          # cp -rv .svelte-kit build node_modules package.json vite.config.* svelte.config.* "$out/lib"
          # export PATH=${pkgs.nodejs}/bin:\$PATH
