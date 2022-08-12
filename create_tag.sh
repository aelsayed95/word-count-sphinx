# get current tag

CURTAG=`git describe --abbrev=0 --tags`;
CURTAG="${CURTAG/v/}"
echo "Current version is ${CURTAG}"

# parse major, minor, patch
IFS='.' read -a vers <<< "$CURTAG"
MAJ=${vers[0]}
MIN=${vers[1]}
PATCH=${vers[2]}

# create new tag with patch++
((PATCH+=1))
NEWTAG="v$MAJ.$MIN.${PATCH}"
echo "Next version is $NEWTAG"
git tag -a $NEWTAG -m $NEWTAG
git push origin $NEWTAG
