#!/bin/bash
echo "Hello, Welcome"

echo "Double quote"
echo "$(ls)"
echo "================================================"
echo "Single quote"
echo '$(ls)'


#output
'
Hello, Welcome
Double quote
1.echo-cmds.sh
testfile
================================================
Single quote
$(ls)
'