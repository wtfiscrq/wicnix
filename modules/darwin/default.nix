{pkgs, ...}: {
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Shell
  programs.zsh.enable = true;

  environment = {
    shells = [pkgs.bash pkgs.zsh];
    loginShell = pkgs.zsh;
  };

  # System Packages
  # systemPackages = [ pkgs.coreutils ];

  # Keyboard
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  # Fonts
  fonts.fontDir.enable = true;
  fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["Hack"];})];

  services.nix-daemon.enable = true;

  ## System Config
  system.defaults = {
    dock.autohide = true;

    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };

  # Yabai Config
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;

    config = {
      window_border = "off";
      window_border_width = 2;
      active_window_border_color = "0xff81a1c1";
      normal_window_border_color = "0xff3b4252";
      focus_follows_mouse = "off"; # autoraise
      mouse_follows_focus = "off";
      mouse_drop_action = "stack";
      window_placement = "second_child";
      window_opacity = "on";
      window_topmost = "off";
      split_ratio = "0.50";
      auto_balance = "on";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      layout = "bsp";
      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;
      window_gap = 12;
    };

    extraConfig = ''
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      sudo yabai --load-sa
    '';
  };

  launchd.user.agents.yabai.serviceConfig = {
    StandardOutPath = "/tmp/yabai.out.log";
    StandardErrorPath = "/tmp/yabai.err.log";
  };

  # skhd
  services.skhd = {
    enable = true;
    skhdConfig = builtins.readFile ./skhdrc;
  };

  launchd.user.agents.skhd.serviceConfig = {
    StandardOutPath = "/tmp/skhd.out.log";
    StandardErrorPath = "/tmp/skhd.err.log";
  };
}
