
let
  polybarOpts = ''
  pasystray &
  blueman-applet &
  nm-applet --sm-disable --indicator &
  numlockx on
  xbanish &
  '';
in
{
  xsession = {
    enable = true;

    initExtra = polybarOpts;

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hp: with hp; [
        dbus
        monad-logger
        xmonad-contrib
      ];
      config = ./config.hs;
    };
  };
}
