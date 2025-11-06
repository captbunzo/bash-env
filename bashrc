#!/bin/bash

#
# bashrc - Main configuration file for bash-tools
#
# Part of bash-tools: Custom Bash Environment Tools
# Copyright (c) 2025 Paul Thompson
# Licensed under MIT License - see LICENSE file for details
#
# Description: This is the main entry point for the bash-tools toolkit. It sets up
# the PATH to include custom scripts and sources all configuration files from
# the bashrc.d directory. Source this file from your ~/.bashrc to enable all
# bash-tools functionality.
#
# Usage: Add "source /path/to/bash-tools/bashrc" to your ~/.bashrc
#

# Get the directory for bash-tools
BASH_TOOLS=$(dirname "${BASH_SOURCE[0]}")

# Add bin directory to PATH
export PATH=$PATH:$BASH_TOOLS/bin

# Source all scripts in bashrc.d
for file in $BASH_TOOLS/bashrc.d/*.sh; do
	[ -r "$file" ] && source "$file"
done
