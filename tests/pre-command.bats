#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

# setup - occurs before each test case
function setup() { 
    stub check \
    'criteria output : echo "checking that it matches criteria"'

    stub send \
    'success-result : echo "SUCCEEDED:pre-command hook used stub successfully"'
}

# teardown - occurs after each test case
function teardown() {
    unstub check
    # unstub --allow-missing send # --allow-missing flag not working
    unstub send
}

@test "Checking criteria output of pre-command hook is working correctly" {
    run "$PWD/hooks/pre-command"

    assert_success
    assert_output --partial "Inside pre-command hook"
    assert_output --partial "Output of Criteria ="
    assert_output --partial "checking that it matches criteria"
}

@test "Ensure result of pre-command hook is correct" {
    run "$PWD/hooks/pre-command"

    assert_success
    assert_output --partial "Inside pre-command hook"
    assert_output --partial "SUCCEEDED"
}
