{ inputs, self, ... }:
{
  perSystem = { system, inputs', pkgs, self', ... }:
    {

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
