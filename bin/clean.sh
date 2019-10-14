#!/usr/bin/env bash 

FIND=$(command -v find)
BUILD_DIR="01-boxes"

mapfile -t CURRENT_BOXES < <(${FIND} ${BUILD_DIR} -name \*.box)

# Remove boxes
if [[ -n "${CURRENT_BOXES[*]}" ]]; then 
  for BOX in "${CURRENT_BOXES[@]}"
  do 
    echo -e "Removing: ${BOX}"
    /bin/rm "${BOX}"
  done
else
  echo "There are no boxes"
fi 