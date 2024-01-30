#!/usr/bin/env zsh

shellcheck --shell="bash" --exclude=SC1091 -- **/*.sh
shellcheck --shell="bash" --exclude=SC1091 -- **/*.zsh
