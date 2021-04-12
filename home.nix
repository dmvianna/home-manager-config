
{ pkgs, ... }:

{
  # programs.home-manager.enable = true;
  imports = [
    # ./programs/xmonad/default.nix
  ];

  # xsession.enable = true;

  home.packages = with pkgs; [
    blueman
    clipmenu
    libreoffice
    pasystray
    udiskie
    xfce.thunar
    xfce.xfconf
    xfce.tumbler
    xfce.exo
  ];

  programs.alacritty.enable = true;

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = "solarized";
    pass = {
      enable = true;
    };
  };

}
