setup() {
  load bats/setup
}

@test "slangroom-exec exists and is executable" {
    assert_file_exists bin/slangroom-exec
    assert_file_executable bin/slangroom-exec
    assert_size_not_zero bin/slangroom-exec
}

@test "Test generic template hello world" {
  slexe test/hello
  assert_output --partial 'Welcome_to_slangroom-exec_🥳'
}

@test "Test generic template timestamp" {
  slexe test/timestamp
  assert_output --partial 'timestamp'
}

@test "Test generic template file read" {
  slexe test/fileread
  assert_output --partial 'Welcome to slangroom-exec 🥳'
}
