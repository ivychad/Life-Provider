#! /bin/bash
cd $TRAVIS_BUILD_DIR
rm -rf site
git clone $GitRepo site >/dev/null 2>&1
cd site
git checkout gh-pages
cd ..
rm -rf site/Provider/$TRAVIS_BRANCH
rm -rf site/api/$TRAVIS_BRANCH
rm -rf site/imp/$TRAVIS_BRANCH
./gradlew projectReport check javadoc publish
echo 
if grep -Fxq $TRAVIS_BRANCH site/branches.txt
    then
        echo branch already exists
    else
        echo $TRAVIS_BRANCH >> site/branches.txt
        echo branch created
    fi
cd site
echo 
git add -A
git commit --amend -a -m "site deploy"
git push -f $GitRepo >/dev/null 2>&1