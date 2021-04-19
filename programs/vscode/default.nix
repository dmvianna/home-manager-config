{ config, lib, pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        extensions = with pkgs.vscode-extensions; [
            bbenoist.Nix
            justusadam.language-haskell
            ms-azuretools.vscode-docker
            ms-vscode-remote.remote-ssh
        ];
        userSettings = {
            "terminal.integrated.fontFamily" = "Hack";
        };
    };
}
