#!/bin/sh
TMP_DIR=/tmp/infocracy-$RANDOM

echo "Installing node dependencies"
npm install
echo "Installing bower dependencies"
bower update
echo "Building website"
gulp build

mkdir $TMP_DIR

# XXX perhaps do this like so:
# for $IGNORED_FILE in `cat .gitignore`;do
# done

mv dist $TMP_DIR
mv bower_components $TMP_DIR
mv node_modules $TMP_DIR

echo "Checking out master branch"
git checkout master
git rm -rf *

echo "Moving the built website in the home"
mv $TMP_DIR/dist/* .
echo "infocracy.io" > CNAME

echo "Adding files"
git add *
echo "Committing update website message"
git commit -a -m 'Update website'
echo "Pushing to master"
git push -u origin master --force

echo "Checking back into code branch"
git checkout code

echo "Moving bower_components and node_modules back"
mv $TMP_DIR/bower_components .
mv $TMP_DIR/node_modules .
