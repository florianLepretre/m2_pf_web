{
  network.description = "My CGI";
  webserver = { config, pkgs, ... }: {
    networking.firewall.allowedTCPPorts = [ 80 ];
    services.lighttpd = {
      enable = true;
      document-root = import ./default.nix {inherit pkgs;};
      enableModules = [ "mod_cgi" ];
      extraConfig = ''
        cgi.assign = ( ".cgi" => "")
      '';
    };
  };
}
