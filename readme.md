# Ehsan's homelab: Traefik automation

## Install Githooks

```sh
chmod +x generate-configs.sh
ln -sf "$(pwd)/generate-configs.sh" .git/hooks/pre-commit
```

Now the configuration files will be automatically generated whenever you commit changes.

## Traefik Configuration Generator

This tool automatically generates Traefik dynamic configuration files from a single `routes.yml` file.

### Requirements

- `yq` command line tool
- bash shell
- git (for pre-commit hook)

### Manual Usage

```bash
./generate-configs.sh
```

### Notes

- Files in the `dynamic` directory starting with `_` (underscore) are preserved
- All other files in the `dynamic` directory are regenerated on each run
- Always edit `routes.yml` to modify configurations, not the generated files
