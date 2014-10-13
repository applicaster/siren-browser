#!/bin/bash

echo deploy to ${GH_REF} gh-pages

if [ "${TRAVIS_BRANCH}" != "master" ]
then
  echo the current branch is ${TRAVIS_BRANCH}
  echo gh-pages can only be deployed from master
  exit 0
fi


rm -rf out || exit 0;
mkdir out;
node build.js
( cd out
 git init
 git config --global user.name "gavriguy"
 git config --global user.email "gavri.guy@gmail.com"
 cp -r ../dist/* .
 git add .
 git commit -m "Deployed to Github Pages"
 git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
)
