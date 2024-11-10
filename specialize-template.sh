#!/bin/bash

set -eo pipefail

NEW_PROJECT_BUNDLE_ID_PREFIX=$1
if [[ -z "${NEW_PROJECT_BUNDLE_ID_PREFIX}" ]]; then
  echo "NEW_PROJECT_BUNDLE_ID_PREFIX is not set"
  exit 1
fi

NEW_PROJECT_NAME=$2
if [[ -z "${NEW_PROJECT_NAME}" ]]; then
  echo "NEW_PROJECT_NAME is not set"
  exit 1
fi

# Remove symlinks, as they can't be modified using `sed`
rm SwiftProjectTemplate.xcworkspace .xcode/SwiftProjectTemplate

# `find` returns folders before their children, so this will always rename the parent folder first.
# We re-run `find` every iteration so that the path is correct after renaming a parent folder.
echo "Moving files..."
while FILE=$(find . -name '*SwiftProjectTemplate*' | head -n1) && [ -n "$FILE" ]; do
  NEW_FILE=$(echo $FILE | sed -e "s/SwiftProjectTemplate/$NEW_PROJECT_NAME/")
  echo "mv \"$FILE\" \"$NEW_FILE\""
  mv "$FILE" "$NEW_FILE"
done
git add -A
echo "Files moved."

echo "Replacing references to SwiftProjectTemplate..."
git ls-files --cached --modified --others --exclude-standard -z |
  xargs -0 -I {} sed -i.template-specialization-backup "s/SwiftProjectTemplate/$NEW_PROJECT_NAME/g" {}

echo "Replacing bundle identifier..."
git ls-files --cached --modified --others --exclude-standard -z |
  xargs -0 -I {} sed -i.template-specialization-backup "s/com.github.georgelyon/$NEW_PROJECT_BUNDLE_ID_PREFIX/g" {}

# Re-add symlinks
ln -s ".xcode/${NEW_PROJECT_NAME}.xcworkspace" "${NEW_PROJECT_NAME}.xcworkspace"
(cd .xcode; ln -s .. "${NEW_PROJECT_NAME}")

echo "Removing backup files..."
find . -name '*.template-specialization-backup' -exec rm {} \;
git add -A

echo "Remove this file and the associated GitHub action."
rm -rf \
  .github/workflows/specialize-template.yml \
  specialize-template.sh

echo "Done."
