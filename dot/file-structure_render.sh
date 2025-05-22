#!/bin/bash
set -e

cd "$(dirname "$0")"  # change to the directory of the script

DOT_FILE="file-structure.dot"
SVG_FILE="fair-structure.svg"

if ! command -v dot &> /dev/null
then
  echo "Error: Graphviz (dot) is not installed."
  exit 1
fi

dot -Tsvg "$DOT_FILE" -o "$SVG_FILE"
echo "Rendered $DOT_FILE → $SVG_FILE"



# how to run
# make it as executable
# chmod +x dot/render.sh

# then  
# ./dot/render.sh

# linux
# sudo apt-get update
# sudo apt-get install graphviz

# mac
# brew install graphviz

# windows
# lord, talk to chatgpt

