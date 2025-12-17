{ pkgs }:

pkgs.mkShell {
  buildInputs = [
    pkgs.direnv
    pkgs.git
    pkgs.bash
    pkgs.zsh
  ];

  shellHook = ''
    # MiniOS directory-aware environment
    eval "$(direnv hook ${pkgs.stdenv.hostShell})"
    echo "Welcome to MiniOS devShell!"
  '';
}
