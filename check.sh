targetShell="bash"

shellcheck ./install.sh --shell=${targetShell}
shellcheck ./check.sh --shell=${targetShell}
