{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "enzobissoli";
  home.homeDirectory = "/var/home/enzobissoli";

  # Packages that should be installed to the user profile
  home.packages = [
    pkgs.htop
    pkgs.neofetch
    pkgs.ripgrep
    pkgs.git
    pkgs.fd
    pkgs.clang
    pkgs.coreutils
    pkgs.direnv
    pkgs.vim
    pkgs.keepassxc
  ];

  programs.git = {
    enable = true;
    userName = "Enzo Bissoli";
    userEmail = "enzogurgel15@gmail.com";
      aliases = {
                  st = "status";
      };
  };
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.emacs = {
    enable = true;
    package = pkgs.emacsNativeComp;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.magit
      epkgs.vterm
      epkgs.pdf-tools
    ];
  };

  services.gpg-agent = {
    enable = true;
    #time to live == Ttl
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
