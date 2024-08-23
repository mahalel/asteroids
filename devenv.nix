{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.pyright
    pkgs.ruff-lsp
    pkgs.black
  ];

  # https://devenv.sh/languages/
  languages.go.enable = true;
  languages.python = {
    enable = true;
    version = "3.11.3";

    venv.enable = true;
    venv.requirements = ./requirements.txt;
  };

  difftastic.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    hello
    git --version
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/pre-commit-hooks/

  pre-commit.hooks = {
    # lint shell scripts
    shellcheck.enable = true;
    # execute example shell from Markdown files
    # mdsh.enable = true;
    # format Python code
    ruff.enable = true;
    trim-trailing-whitespace.enable = true;

  };

  # See full reference at https://devenv.sh/reference/options/
}
