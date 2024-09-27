{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sbcl
  ];
}
