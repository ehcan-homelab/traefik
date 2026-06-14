# ehcan-homelab/traefik

Traefik reverse proxy configs for lab.ehcan.io — auto-generated from `routes.yml`.

## Quickstart

```sh
make hooks    # Install githooks (core.hooksPath=.githooks)
make generate # Generate dynamic configs from routes.yml
```

## How it works

- Edit `routes.yml` — single source of truth for all services
- `generate-configs.sh` reads routes.yml, writes per-service configs to `traefik/dynamic/`
- Pre-commit hook runs generate + stages results automatically
- Files starting with `_` in `dynamic/` are preserved; everything else is regenerated

## Add a service

Add an entry to `routes.yml`. Each entry has 3 fields:

| Field     | Description                                                                      |
| --------- | -------------------------------------------------------------------------------- |
| `name`    | Service name — used as the config filename and Traefik router/service identifier |
| `domains` | Comma-separated domains for routing (e.g. `app.lab.ehcan.io,app.media.ehcan.io`) |
| `urls`    | Comma-separated upstream URLs — multiple URLs enable load balancing              |

```yaml
- name: myapp
  domains: myapp.lab.ehcan.io
  urls: http://10.0.0.1:8080
```

URLs starting with `https://` automatically get `serversTransport: insecureSkipVerifyTransport`.

Commit — config auto-generates.
