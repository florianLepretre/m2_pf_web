{
  network.description = "My webpage";
  webserver = { config, pkgs, ... }: {
    networking.firewall.allowedTCPPorts = [ 80 ];
    services.lighttpd = {
      enable = true;
      document-root = import ./default.nix;
    };
  };
}
