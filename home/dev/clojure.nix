{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clojure
    cljfmt
  ];
}
