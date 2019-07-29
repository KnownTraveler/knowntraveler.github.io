#! /bin/bash

JEKYLL_VERSION=3.8.6
CURRENT_DATE=`date +"%Y-%m-%d %T"`

echo "Running Docker Build Process"
echo ""

docker run --rm --volume="$PWD:/srv/jekyll" -p 4000:4000 -it jekyll/jekyll:$JEKYLL_VERSION jekyll build

echo ""
echo ""
echo "Committing Latest Build to github.com/knowntraveler/knowntraveler-web"
git add .
git commit -m "Committing Latest Site Build - $DATE"
git push -u origin master

echo ""
echo ""
echo "Deploying Latest Build to github.com/knowntraveler/knowntraveler.github.io"
cd ./_site
git add .
git commit -m "Deploying Latest Site Build - $DATE"
git push -u origin master

