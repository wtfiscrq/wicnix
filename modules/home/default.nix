({pkgs, ...}: {
  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    air
    curl
    fd
    jq
    less
    ripgrep
  ];

  home.sessionVariables = {
    PAGER = "less";
    EDITOR = "hx";
  };

  programs.bat.enable = true;
  programs.exa.enable = true;

  programs.git = {
    enable = true;
    userName = "João Cerqueira";
    userEmail = "joao@crq.wtf";

    aliases = {
      ap = "add -p";
      c = "commit -s";
      cl = "clean -fd";
      co = "checkout";
      p = "push";
      pl = "pull";
      rd = "rev-parse --show-toplevel";
      s = "status";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ls = "ls --color=auto -F";
      ll = "ls -al";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.9";
      dynamic_background_opacity = "yes";
      # macos_traditional_fullscreen yes
      font_family = "Hack";
      disable_ligatures = "never";
      macos_hide_titlebar = "yes";
      hide_window_decorations = "titlebar-only";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
      };
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      editor.indent-guides = {
        render = true;
      };
      editor.lsp = {
        display-messages = true;
      };
      keys.insert = {
        j = {k = "normal_mode";};
      };
      editor.file-picker = {
        hidden = false;
      };
    };
  };
})
