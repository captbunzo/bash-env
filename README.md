# bash-tools

My fun and occasionally useful collection of bash tools and scripts.

## Author

Paul Thompson
- Discord: [captbunzo](https://discord.com/users/211955406535131136)
- Email: captbunzo@gmail.com
- LinkedIn: https://linkedin.com/in/paulthompson

## Overview

A hodgepodge of custom bash utilities I've built over time. Some are genuinely useful, others are just for fun. Feel free to use whatever you find interesting!

## What's in here

- **[project-connect](docs/project-connect.md)**: Jump into project workspaces with screen sessions
- **[randomize-grub-theme](docs/randomize-grub-theme.md)**: Because who doesn't want a surprise boot theme?

Both tools include tab completion and other niceties to make them actually usable.

## Quick Start

Clone it somewhere:

```bash
git clone https://github.com/captbunzo/bash-tools.git ~/bash-tools
```

Add this to your `~/.bashrc`:

```bash
source ~/bash-tools/bashrc
```

Reload your bash:
```bash
source ~/.bashrc
```

Then check out the individual tool docs for usage details.

## Project Structure

```
bash-tools/
├── bashrc                               # Main configuration entry point
├── bin/                                 # Executable scripts
│   ├── project-connect                  # Project workspace connector
│   └── randomize-grub-theme             # GRUB theme randomizer
├── bashrc.d/                            # Modular configuration files
│   └── project-connect.complete.sh      # Bash completion for project-connect
├── docs/                                # Documentation
│   ├── project-connect.md               # project-connect documentation
│   └── randomize-grub-theme.md          # randomize-grub-theme documentation
├── systemd/                             # Systemd service files
│   ├── system/                          # Service definitions
│   │   └── randomize-grub-theme.service # Service for automatic theme randomization
│   ├── install-service.sh               # Install systemd service
│   └── uninstall-service.sh             # Uninstall systemd service
├── LICENSE                              # MIT License
└── README.md                            # This file
```

## Contributing

Found a bug? Have an idea? Feel free to open an issue or send a pull request.

## License

MIT License - do whatever you want with this stuff.

## Copyright

Copyright (c) 2025 Paul Thompson
