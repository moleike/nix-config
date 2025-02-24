{

  home.username = "Alex.Moreno";

  programs.git.extraConfig = {
     url."ssh://git@github.com/nqcentral/".insteadOf = [
       "https://github.com/nqcentral/"
       "git@github.com:nqcentral/"
     ];
     url."ssh://git@github.com/amoreno-netquest/".insteadOf = [
       "https://github.com/amoreno-netquest/"
       "git@github.com:amoreno-netquest/"
     ];

     # workaround to corporate firewall
     http."https://git.savannah.gnu.org".sslcainfo = "/opt/zscaler.crt";
   };

  programs.ssh.matchBlocks = {
    "*.netquest-apps.com" = {
      user = "amoreno";
    };
  };
}
