setup() {
  load bats/setup
  PATH="$PWD/bin:$PATH"
}

contract_with_data() {
    slexfe -d test/${1}.data.json -s test/${1}.slang | slangroom-exec
}

contract() {
    slexfe -s test/${1}.slang 2>&1 | slangroom-exec 
}

@test "Test generic template hello world" {
  run contract hello
  assert_output --partial "Welcome_to_slangroom-exec_🥳"
}

@test "Test generic template timestamp" {
  run contract timestamp
  assert_output --partial 'timestamp'
}

@test "Test generic template file read" {
  export FILES_DIR=${PWD}
  run contract_with_data fileread
  assert_output --partial 'Welcome to slangroom-exec 🥳'
}
