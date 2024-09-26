{ config, pkgs, ... }:
let 
  myAliases = {
    ll = "ls -l";
  };
in
{
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };
}
