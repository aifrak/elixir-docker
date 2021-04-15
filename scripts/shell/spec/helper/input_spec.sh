#!/bin/sh

Describe 'input.sh'
  Include ./helper/input.sh

  ExampleGroup "validate_inputs"
    It 'should validate inputs with success'
      elixir_version="1.2.3"
      erlang_version="4.5.6"

      When call validate_inputs $elixir_version $erlang_version
      The status should be success
    End

    It 'should print an error when no input given'
      When run validate_inputs
      The status should be failure
      The output should equal ""
      The error should equal "${RED}Error: Elixir version is empty${NORMAL}"
    End

    It 'should print an error when Erlang version is missing'
      elixir_version="1.2.3"

      When run validate_inputs $elixir_version
      The status should be failure
      The output should equal ""
      The error should equal "${RED}Error: Erlang version is empty${NORMAL}"
    End
  End

  It "should build the tag name"
    elixir_version="1.2.3"
    erlang_version="4.5.6"

    When call build_tag_name tag "$elixir_version" "$erlang_version"
    The output should equal "v${elixir_version}-${erlang_version}-erlang-buster-slim"
  End
End
