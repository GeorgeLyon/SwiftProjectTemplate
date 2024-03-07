#!/bin/bash

set -euo pipefail

if [[ -z "${NEW_PROJECT_NAME}" ]]; then
  echo "NEW_PROJECT_NAME is not set"
  exit 1
fi

if [[ -z "${NEW_PROJECT_BUNDLE_ID_PREFIX}" ]]; then
  echo "NEW_PROJECT_BUNDLE_ID_PREFIX is not set"
  exit 1
fi

# `find` returns folders before their children, so this will always rename the parent folder first.
# We re-run `find` every iteration so that the path is correct after renaming a parent folder.
while FILE=$(find . -name '*SwiftProjectTemplate*' | head -n1) && [ -n "$FILE" ]; do
  NEW_FILE=$(echo $FILE | sed -e "s/SwiftProjectTemplate/$NEW_PROJECT_NAME/")
  echo "mv \"$FILE\" \"$NEW_FILE\""
  mv "$FILE" "$NEW_FILE"
done
git add -A

# Replace references to `SwiftProjectTemplate`
git ls-files --cached --modified --others --exclude-standard -z |
  xargs -0 sed -i '' -e "s/SwiftProjectTemplate/$NEW_PROJECT_NAME/g"

# Replace bundle identifier
git ls-files --cached --modified --others --exclude-standard -z |
  xargs -0 sed -i '' -e "s/com.github.georgelyon/$NEW_PROJECT_BUNDLE_ID_PREFIX/g"
