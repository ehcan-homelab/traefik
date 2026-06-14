.PHONY: hooks generate

# Install pre-commit hook via .githooks directory
hooks:
	chmod +x generate-configs.sh
	ln -sf ../generate-configs.sh .githooks/pre-commit
	git config core.hooksPath .githooks

# Generate Traefik dynamic configs from routes.yml
generate:
	./generate-configs.sh