#!/bin/sh

# shellcheck source=./scripts/shell/helper/shell-utils.sh
. "./helper/shell-utils.sh"

# Validate the given versions in input.
#
# Input:  $1 -> elixir_version:string
#         $2 -> erlang_version:string
# Output: 0 -> int
validate_inputs() {
  elixir_version=$1
  erlang_version=$2

  validate_version "Elixir" "$elixir_version"
  validate_version "Erlang" "$erlang_version"

  return 0
}

# Build the tag name from the inputs.
#
# Input:  $1 -> elixir_version:string
#         $2 -> erlang_version:string
# Output: Generated tag
build_tag_name() {
  elixir_version=$1
  erlang_version=$2

  print "v${elixir_version}-${erlang_version}-erlang-buster-slim"
}
