{ config, pkgs, lib, ... }:

{
  options.miniOS.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable MiniOS core features";
  };

  config = lib.mkIf config.miniOS.enable {
    environment.systemPackages = with pkgs; [ direnv ];
  };
}
