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

echo $ANSWER

if [ "$ANSWER" == "y" ] || [ "$ANSWER" == "Y" ]; then
  mkdir -p $SOURCE_PATH
  cd $SOURCE_PATH
  echo "<html><head><meta http-equiv=\"refresh\" content\"0; url=$LONG_URL/$TARGET_PATH\" /></head><body></body></html>" > index.html
fi

