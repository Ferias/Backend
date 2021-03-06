#!bin/bash
CHANGES_LOG=$(git diff --name-only HEAD $(git merge-base HEAD $TRAVIS_BRANCH)) 
# CHANGES_LOG gets all differences between the master tree and the tree thats edidet and checked by travis
echo "Changes were made in the following files:"$CHANGES_LOG

if [[ "$CHANGES_LOG" == *"angular"* ]];
then FLAG=1
fi

if [[ "$CHANGES_LOG" == *"springCass"*  ]];
then FLAG=2
fi

if [[ "$CHANGES_LOG" == *"angular"*"springCass"* || "$CHANGES_LOG" == *"springCass"*"angular"* || "$CHANGES_LOG" == *"scripts"* || "$CHANGES_LOG" == *"travis.yml"*  ]];
then FLAG=3
fi
echo "FLAG ="$FLAG

# FLAG = 0 means there is no change in angular or scpringCass subdirectory, therefore the before_install step will be skipped
# FLAG = 1 means there is only a chnage in angular
# FLAG = 2 means there is only a chnage in springCass
# # FLAG = 3 means there is a chnage in springCass and angular or in the sripts
