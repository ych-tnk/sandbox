.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS := -eux -o pipefail -c

PROJECT_ROOT := $(shell dirname $(CURDIR))

DEVCONTAINER_ROOT := $(PROJECT_ROOT)/.devcontainer
DEVCONTAINER_CONFIG := $(DEVCONTAINER_ROOT)/config

post-create: setup-known-hosts setup-go-workspace setup-project

.PHONY: setup-known-hosts
setup-known-hosts:
	mkdir -p -m 0700 ~/.ssh
	ssh-keyscan github.com > ~/.ssh/known_hosts

.PHONY: setup-go-workspace
setup-go-workspace:
	cp $(DEVCONTAINER_CONFIG)/go/go.work $(PROJECT_ROOT)/go.work 

setup-project:
	make -C $(PROJECT_ROOT) --makefile=$(PROJECT_ROOT)/Makefile setup
