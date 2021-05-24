
{ pkgs, ... }:

{
  # programs.home-manager.enable = true;
  imports = [
    # ./programs/vscode/default.nix
    # ./programs/xmonad/default.nix
  ];

  # xsession.enable = true;

  home.packages = with pkgs; [
    arandr
    blueman
    clipmenu
    gimp
    home-manager
    imagemagick
    jq
    libreoffice
    pasystray
    poetry
    rnix-lsp
    udiskie
    vscode
    xclip
    xfce.thunar
    xfce.xfconf
    xfce.tumbler
    xfce.exo
  ];

  # programs.alacritty.enable = true;

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = "solarized";
    # pass = {
    #   enable = true;
    # };
  };

}
