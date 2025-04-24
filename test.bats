setup() {
  load bats/setup
}

@test "slangroom-exec exists and is executable" {
    run slangroom-exec --version
    assert_success
    assert_output --partial 'License AGPL-3.0-or-later: GNU AGPL version 3 <https://www.gnu.org/licenses/agpl-3.0.html>'
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
