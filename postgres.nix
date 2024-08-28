{ config, pkgs, ... }:
{
  imports = [];

  config.services.postgresql = {
    enable = true;
    ensureDatabases = [ "mydatabase" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
			host	all				all			::1/32		trust
    '';
  };
}
