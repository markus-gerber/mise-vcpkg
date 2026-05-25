# Mise Vcpkg Plugin

This repository provides a plugin for managing [vcpkg](https://github.com/Microsoft/vcpkg) installations using [Mise](https://mise.jdx.dev).

The plugin provides `vcpkg` through the following steps:

1. Clone the vcpkg repository from GitHub, including all commits (useful for using vcpkg's `builtin-baseline`)
2. Download the vcpkg tool using the appropriate script (e.g., `bootstrap-vcpkg.sh` on Linux)
3. Add vcpkg to the system `PATH`, and set the `VCPKG_ROOT` environment variable to the installation directory

## Development Workflow

### Setting up development environment

1. Install pre-commit hooks (optional but recommended):
```bash
hk install
```

This sets up automatic linting and formatting on git commits.

### Local Testing

1. Link your plugin for development:
```bash
mise plugin link --force vcpkg .
```

2. Run tests:
```bash
mise run test
```

3. Run linting:
```bash
mise run lint
```

4. Run full CI suite:
```bash
mise run ci
```

### Code Quality

This template uses [hk](https://hk.jdx.dev) for modern linting and pre-commit hooks:

- **Automatic formatting**: `stylua` formats Lua code
- **Static analysis**: `luacheck` catches Lua issues
- **GitHub Actions linting**: `actionlint` validates workflows
- **Pre-commit hooks**: Runs all checks automatically on git commit

Manual commands:
```bash
hk check      # Run all linters (same as mise run lint)
hk fix        # Run linters and auto-fix issues
```

### Debugging

Enable debug output:
```bash
MISE_DEBUG=1 mise install vcpkg@latest
```

## License

MIT
