{-# LANGUAGE OverloadedStrings #-}

import           System.IO
import           System.Process
import           XMonad
import           XMonad.Config.Xfce
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops  (ewmh)
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Util.EZConfig       (additionalKeys, additionalKeysP)
import           XMonad.Util.Run            (spawnPipe)

main = do
  xmonad . docks . ewmh $ xfceConfig
    { manageHook = manageDocks
                   <+> myManageHook
                   <+> manageHook def
    , layoutHook = avoidStruts $ layoutHook def
    , terminal = myTerminal
    , normalBorderColor = "#cccccc"
    , focusedBorderColor = "#cd8b00"
    -- , modMask = mod4Mask -- depends on ~/.Xmodmap assigning Alt_R to mod3
    } `additionalKeys` keyBindings
    `additionalKeysP` mediaKeys

keyBindings =
  [
    -- lock screen
    ((mod1Mask .|. shiftMask, xK_z), spawn "dm-tool lock")
  , ((mod1Mask, xK_p), spawn "rofi -show run")

  ]

mediaKeys =
  [
    ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +1.5%")
  , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@  -1.5%")
  , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")

  -- Configuration moved to /etc/nixos/configuration.nix
  -- , ("<XF86AudioPlay>", spawn "playerctl play-pause")
  -- , ("<XF86AudioPrev>", spawn "playerctl previous")
  -- , ("<XF86AudioNext>", spawn "playerctl next")

  , ("<XF86MonBrightnessDown>", spawn "light -U 5")
  , ("<XF86MonBrightnessUp>", spawn "light -A 5")

  ]

myManageHook = composeAll
  [
    className =? "Xmessage" --> doCenterFloat
  , className =? "Nm-connection-editor" --> doCenterFloat
  ]

myTerminal = "alacritty"
