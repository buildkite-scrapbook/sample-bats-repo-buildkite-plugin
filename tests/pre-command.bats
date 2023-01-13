#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

# setup - occurs before each test case
setup() { 
    stub send \
    'success-result : echo "SUCCEEDED:pre-command hook used stub successfully"'

}

# teardown - occurs after each test case
teardown() {
    unstub send    
}

@test "Checks pre-command hook is working properly" {
  run "$PWD/hooks/pre-command"

  assert_success
  assert_output --partial "Inside pre-command hook"
  assert_output --partial "SUCCEEDED"
}
