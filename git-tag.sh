#!/bin/sh

elixir_version=$1 # format: x.y.z
erlang_version=$2 # format: x.y.z

errors=false

[ -z ${elixir_version} ] && errors=true && echo "Elixir version is empty"
[ -z ${erlang_version} ] && errors=true && echo "Erlang version is empty"

[ ${errors} = true ] && exit

tagged_version=v${elixir_version}-${erlang_version}-erlang-buster-slim

echo ""
echo "Version to tag: ${tagged_version}"
echo ""
echo "Push this tag? (y/n)"
read answer
echo ""

if [ "$answer" != "${answer#[Yy]}" ]; then
  git tag v${elixir_version}-${erlang_version}-erlang-buster-slim
  git push --tags
else
  echo Operation cancelled
fi
