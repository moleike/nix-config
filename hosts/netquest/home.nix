{
  home.username = "amoreno";

  # Active module profile for netquest host
  modules = {
    dev = {
      agda.enable = true;
      agents.enable = true;
      coq.enable = true;
      lean.enable = true;
      nodejs.enable = true;
      python.enable = true;
      racket.enable = true;
      rust.enable = true;
      scala.enable = true;
    };
    infra = {
      cloud.enable = true;
      sec.enable = true;
    };
  };

  programs.git.settings = {
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

  programs.ssh.settings = {
    "*.netquest-apps.com" = {
      user = "amoreno";
    };
  };
}
