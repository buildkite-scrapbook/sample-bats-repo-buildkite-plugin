#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Checks pre-command hook is working properly" {
  stub send 'success-result : echo "SUCCEEDED:pre-command hook used stub successfully"'

  run "$PWD/hooks/pre-command"

  assert_success
  assert_output --partial "Inside pre-command hook"
  assert_output --partial "SUCCEEDED"

  unstub send
}
