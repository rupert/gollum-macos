#!/bin/bash

set -euo pipefail

git fetch

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse '@{u}')
BASE=$(git merge-base HEAD '@{u}')

if [ "$LOCAL" = "$REMOTE" ]; then
    exit 0
elif [ "$LOCAL" = "$BASE" ]; then
    git rebase
    osascript -e 'display notification "Pulled." with title "Gollum"'
elif [ "$REMOTE" = "$BASE" ]; then
    git push
    osascript -e 'display notification "Pushed." with title "Gollum"'
else
    git rebase
    git push
    osascript -e 'display notification "Rebased." with title "Gollum"'
fi
