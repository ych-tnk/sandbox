.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS := -eux -o pipefail -c

AQUA_VERSION=v2.15.0

.PHONY: setup
setup: setup-development-tools

.PHONY: setup-development-tools
setup-development-tools: ~/.local/bin/aqua
	aqua install

~/.local/bin/aqua:
	curl -fsSL https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.1.1/aqua-installer | bash -s -- -v "$(AQUA_VERSION)"
	mkdir ~/.local/bin
	ln -s ~/.local/share/aquaproj-aqua/bin/aqua ~/.local/bin/aqua
