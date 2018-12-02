#!/bin/bash

set -e
cd "$(dirname "$(readlink -f "${0}")")"

SHORT_URL=lvdr.one
LONG_URL=https://levidrone.com

echo -n "Short URL: $SHORT_URL/"
read SOURCE_PATH
echo -n "Redirect to URL: $LONG_URL/"
read TARGET_PATH
echo -e "\n$SHORT_URL/$SOURCE_PATH -> $LONG_URL/$TARGET_PATH"
echo -n "All right? (y/N): "
read ANSWER

if [ "$ANSWER" == "y" ] || [ "$ANSWER" == "Y" ]; then
  echo -e "\nMake directory: '$SOURCE_PATH'"
  mkdir -p $SOURCE_PATH
  cd $SOURCE_PATH
  echo "Generate page: '$SOURCE_PATH/index.html'"
  echo "<html><head><meta http-equiv=\"refresh\" content\"0; url=$LONG_URL/$TARGET_PATH\" /></head><body></body></html>" > index.html
  echo -e "\nDone! Commit, push and enjoy!"
fi

