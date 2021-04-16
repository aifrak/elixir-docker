#!/bin/sh

MAKEFILE_UTILS_DIR := ./scripts/makefile/makefile-utils

include $(MAKEFILE_UTILS_DIR)/docker-hub.mk

SHELL:=sh

.PHONY: git-tag-release
git-tag-release:
	@(cd ${PWD}${SHELL_SCRIPT_DIR} && $(SHELL) git-tag-release.sh)
