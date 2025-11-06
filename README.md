# bash-env

My Custom Bash Environment Tools

## Overview

This repository contains a collection of custom bash scripts and configurations designed to enhance productivity in development environments. The toolkit provides utilities for project management, screen session handling, and bash completion.

## Features

- **Project Connection**: Easily connect to project workspaces using screen sessions
- **Tab Completion**: Intelligent bash completion for project and app navigation
- **Modular Design**: Organized structure with separate configuration files
- **PATH Integration**: Automatic addition of custom scripts to your PATH

## Installation

1. Clone this repository to your preferred location:

   ```bash
   git clone https://github.com/captbunzo/bash-env.git ~/bash-env
   ```

2. Add the following line to your `~/.bashrc`:

   ```bash
   source ~/bash-env/bashrc
   ```

3. Reload your bash configuration:
   ```bash
   source ~/.bashrc
   ```

## Usage

### project-connect

Connect to a project workspace using screen sessions:

```bash
project-connect <project> [app]
```

- `project`: Name of the project directory in `~/src/`
- `app`: Optional app subdirectory within the project

Examples:

```bash
project-connect mywebapp
project-connect mywebapp frontend
```

## Project Structure

```
bash-env/
├── bashrc                           # Main configuration entry point
├── bin/                             # Executable scripts
│   └── project-connect              # Project workspace connector
├── bashrc.d/                        # Modular configuration files
│   └── project-connect.complete.sh  # Bash completion for project-connect
├── LICENSE                          # MIT License
└── README.md                        # This file
```

## Contributing

Feel free to submit issues and pull requests to improve this toolkit.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Paul Thompson
