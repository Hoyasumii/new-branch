#!/bin/bash

oldBranch=$1;
newBranch=$2;

if !(git rev-parse --verify $oldBranch >/dev/null 2>&1); then
    echo "A branch $oldBranch não existe.";
    exit 0;
fi

git switch $oldBranch;

if git remote -v | grep -q "fetch"; then
	git pull;
fi

git checkout -b $newBranch;

