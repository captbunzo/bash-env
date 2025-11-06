#!/bin/bash

#
# project-connect.complete.sh - Bash completion for project-connect script
#
# Part of bash-tools: Custom Bash Environment Tools
# Copyright (c) 2025 Paul Thompson
# Licensed under MIT License - see LICENSE file for details
#
# Description: This script provides bash tab completion for the project-connect
# command. It completes project names from ~/src directory and app names from
# the apps subdirectory within each project.
#

_project-connect-completion() {
	local cur prev opts

	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD - 1]}"
	opts="$(compgen -W '$(ls ~/src)' -- $cur)"

	if [[ $COMP_CWORD -eq 1 ]]; then
		COMPREPLY=($(compgen -W '$(ls ~/src)' -- $cur))
	elif [[ $COMP_CWORD -eq 2 ]]; then
		COMPREPLY=($(compgen -W '$(ls ~/src/$prev/apps)' -- $cur))
	fi

	return 0
}

complete -F _project-connect-completion project-connect
