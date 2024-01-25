targetShell=bash

shellcheck ./install.sh ${targetShell}
shellcheck ./check.sh --shell ${targetShell}
