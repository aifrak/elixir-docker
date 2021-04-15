#!/bin/sh

# shellcheck source=./scripts/shell/helper/input.sh
. "./helper/input.sh"

test || __() { :; } # Used by shellspec interceptor https://github.com/shellspec/shellspec#test--__---

__ begin __ # Begin shellspec interceptor

elixir_version=$1 # format: x.y.z
erlang_version=$2 # format: x.y.z

ask_version elixir_version "Elixir" "$elixir_version"
ask_version erlang_version "Erlang" "$erlang_version"

validate_inputs "$elixir_version" "$erlang_version"

tag=$(build_tag_name "$elixir_version" "$erlang_version")

tag_version "$tag"

__ end __ # End shellspec interceptor
