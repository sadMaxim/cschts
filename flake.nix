{
  description = "anna-page";
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./shell.nix
        ./client
      ];
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      flake.herculesCI.ciSystems = [ "x86_64-linux" ];
    };
nixConfig = {
    substituters = [
       "https://cache.nixos.org/" 
       "https://aseipp-nix-cache.global.ssl.fastly.net"
       "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
  };

}
