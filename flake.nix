{
  description = "My new NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        
        
        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            ./config.nix
            ./desktop
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.shaun = {
                imports = [ ./home.nix ./desktop/home.nix ];
              };
            }
          ];
        };

        
        laptop = lib.nixosSystem {
          inherit system;
          modules = [
            ./config.nix
            ./laptop
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.shaun = {
                imports = [ ./laptop/home.nix ];
              };
            }
          ];
        };
      };
    };
  }
