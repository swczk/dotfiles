{ config, pkgs, ... }:

let
  identity = import ./resources/identity.nix;

in
{
  imports = [
     ./containers/traefik.nix
     ./containers/homepage.nix
     ./containers/vaultwarden.nix
     ./containers/portainer.nix
     ./containers/syncthing.nix
  ];

   virtualisation = {
    docker = {
      enable = true;
      enableNvidia = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
   };

    # podman = {
    #   enable = true;
    #   enableNvidia = true;
    #   # Create a `docker` alias for podman, to use it as a drop-in replacement
    #   dockerCompat = true;
    #   dockerSocket.enable = true;
    #   defaultNetwork.settings = {
    #     dns_enabled = true;
    #   };
    #   autoPrune = {
    #     enable = true;
    #     dates = "weekly";
    #   };
    # };
    # we enable and use podman - very similar to docker
    oci-containers.backend = "docker";

    containers.registries.search = [ "docker.io" "ghcr.io" "lscr.io" ];

    # Virtual machines
    libvirtd.enable = true;
  };

  networking.firewall = {
    # enable = true;
    # allowedTCPPorts = [ 22 80 443 ];
    interfaces.containers = {
      allowedUDPPorts = [ 53 ]; # this needs to be there so that containers can look eachother's names up over DNS
    };
  };
    
  # we create a systemd service so that we can create a single "pod"
  # for our containers to live inside of. This will mimic how docker compose
  # creates one network for the containers to live inside of
  systemd.services.containers-network = with config.virtualisation.oci-containers; {
    serviceConfig.Type = "oneshot";
    wantedBy = [ "${backend}-traefik.service" "${backend}-homepage.service" "${backend}-portainer.service" "${backend}-vaultwarden.service" "${backend}-syncthing.service" ];
    script = ''
      ${pkgs.docker}/bin/${backend} network exists containers-network || \
      ${pkgs.docker}/bin/${backend} network create containers-network
      '';
  };
  
  # Permissions
  users.users.pedrojosawczuk.extraGroups = [ "libvirtd" "podman" "network"];
}