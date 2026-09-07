{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;

#      format = "$directory$git_branch$git_status$character";
#
      character = {
        success_symbol = "[λ](bold #98be65) ";
        error_symbol = "[λ](bold #ff6c6b) ";
      };
#
#      directory = {
#        style = "bold #51afef";
#        truncation_length = 3;
#        truncate_to_repo = true;
#      };
#
#      git_branch = {
#        style = "bold #ff8c00";
#        format = "on [$branch]($style) ";
#      };
#
#      git_status = {
#        style = "bold #ff6c6b";
#        format = "([$all_status$ahead_behind]($style) )";
#     };
    };
  };
}

