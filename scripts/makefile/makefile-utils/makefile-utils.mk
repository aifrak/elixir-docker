#!/bin/sh

# Source: https://github.com/aifrak/makefile-utils

# Colors
GREEN = $(shell echo "\e[32m")
NORMAL = $(shell echo "\e[0m")

# Print a success message
# Input:	$(1) -> string Success message to print
print_success = "$(GREEN)✔$(1)$(NORMAL)"
