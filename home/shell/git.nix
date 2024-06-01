inputs @ { ... }:
{
  home.shellAliases = {
    gadd = "git add";
    gclone = "git clone";
    gcomm = "git commit -m";
    gcommit = "git commit";
    gdiff = "git diff";
    ginit = "git init";
    glog = "git log";
    gpull = "git pull";
    gpush = "git push";
    gstat = "git status";
    gstatus = "git status";
  };

  programs.git = {
    enable = true;
    delta.enable = true;
    userName = "Karl Meakin";
    userEmail = "karlwfmeakin@gmail.com";
  };

  programs.gh = {
    enable = true;
  };
}
