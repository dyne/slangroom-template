Rule unknown ignore
Given I send path 'filename' and read verbatim file content and output into 'content'
# Prepare 'content': read verbatim file 'filename'
Given I have a 'string' named 'filename'
Given I have a 'string' named 'content'
Then print data
