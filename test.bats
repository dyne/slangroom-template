load bats/setup

@test "Test generic template hello world" {
  slexe test/hello
}

@test "Test generic template timestamp" {
  slexe test/timestamp
  assert_output --partial 'timestamp'
}
