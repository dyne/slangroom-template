# Rule unknown ignore
# Given I fetch the local timestamp in seconds and output into 'timestamp'
# Given I have a 'time' named 'timestamp'
# Then print the 'timestamp'

rule unknown ignore
Prepare 'timestamp': fetch the local timestamp in seconds
Given I have a 'time' named 'timestamp'
Then print the 'timestamp'
