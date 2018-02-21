#!/bin/sh

# Please consider to copy this file on .git/hooks/pre-commit file and 
# give to the file the correct permissions.
# cp precommit.sh ./git/hooks/pre-commit
# chmod +x .git/hooks/post-commit

# Colors helpers
C_YELLOW='\033[1;33m'
C_GREEN='\033[0;32m'
C_NC='\033[0m'

# Start precommit process
echo "${C_YELLOW}Oh boy, do some things before...${C_NC}"
rails test
RESULT=$?
echo "\n${C_GREEN}All is done! :)${C_NC}\n"

[ $RESULT -ne 0 ] && exit 1
exit 0
