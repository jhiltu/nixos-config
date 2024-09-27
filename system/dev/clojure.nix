{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clojure
    leiningen
    cljfmt
  ];
}
