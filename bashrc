#!/bin/bash

#
# bashrc - Main configuration file for bash-env
#
# Part of bash-env: Custom Bash Environment Tools
# Copyright (c) 2025 Paul Thompson
# Licensed under MIT License - see LICENSE file for details
#
# Description: This is the main entry point for the bash-env toolkit. It sets up
# the PATH to include custom scripts and sources all configuration files from
# the bashrc.d directory. Source this file from your ~/.bashrc to enable all
# bash-env functionality.
#
# Usage: Add "source /path/to/bash-env/bashrc" to your ~/.bashrc
#

# Get the directory for bash-env
BASH_ENV=$(dirname "${BASH_SOURCE[0]}")

# Add bin directory to PATH
export PATH=$PATH:$BASH_ENV/bin

# Source all scripts in bashrc.d
for file in $BASH_ENV/bashrc.d/*.sh; do
	[ -r "$file" ] && source "$file"
done
