# project-connect

Connect to project workspaces using screen sessions.

## Usage

```bash
project-connect <project> [app]
```

- `project`: Name of the project directory in `~/src/`
- `app`: Optional app subdirectory within the project

## Examples

```bash
project-connect mywebapp
project-connect mywebapp frontend
```

## How it works

The script creates or connects to a screen session for your project, automatically navigating to the project directory. If you specify an app subdirectory, it will navigate there instead.

This is particularly useful for maintaining persistent development sessions that survive terminal disconnections.

## Tab Completion

The script includes intelligent bash completion that:
- Suggests project names from your `~/src/` directory
- Suggests app subdirectories when you're specifying a second argument
- Works with partial matches

The completion is automatically loaded when you source the main bashrc file.