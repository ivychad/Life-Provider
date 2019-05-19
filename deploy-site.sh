#! /bin/bash
rm -rf site
git clone $GitRepo site >/dev/null 2>&1
cd site
git checkout gh-pages
cd ..
./gradlew projectReport check javadoc
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
git commit --amend -a -m "site deploy"
git push -f $GitRepo >/dev/null 2>&1