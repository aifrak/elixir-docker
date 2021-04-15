#!/bin/sh

Describe 'git-tag-release.sh'
  RED="\e[31m"
  NORMAL="\e[0m"

  Intercept begin
  __begin__() {
    ask_version() { true; } # Mock does nothing
    tag_version() { true; } # Mock does nothing
  }

  It 'should tag version with success'
    Mock ask_version
      # Do nothing
    End

    When run source ./git-tag-release.sh "elixir_version" "erlang_version"
    The status should be success
  End

  It 'should print an error when no input given'
    When run source git-tag-release.sh
    The status should be failure
    The output should equal ""
    The error should equal "${RED}Error: Elixir version is empty${NORMAL}"
  End

  It 'should print an error when Erlang version is missing'
    When run source ./git-tag-release.sh "elixir_version"
    The status should be failure
    The output should equal ""
    The error should equal "${RED}Error: Erlang version is empty${NORMAL}"
  End
End
