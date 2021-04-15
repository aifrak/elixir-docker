#!/bin/sh

MAKEFILE_UTILS_DIR := ./scripts/makefile/makefile-utils

include $(MAKEFILE_UTILS_DIR)/shell-test.mk
include $(MAKEFILE_UTILS_DIR)/docker-hub.mk

SHELL:=sh

SHELL_SCRIPT_DIR := /scripts/shell

SHELLCHECK_PATH := .${SHELL_SCRIPT_DIR}/**/**.sh
SHELLSPEC_HOST_DIR := ${PWD}${SHELL_SCRIPT_DIR}

.PHONY: git-tag-release
git-tag-release:
	@(cd ${PWD}${SHELL_SCRIPT_DIR} && $(SHELL) git-tag-release.sh)
