#! /bin/bash
rm -r site
git clone $GitRepo site
cd site
git checkout gh-pages
cd ..
./gradlew projectReport check javadoc
if grep -Fxq site/branches.txt $TRAVIS_COMMIT
echo $TRAVIS_COMMIT >>site/branches.txt
fi
cd site
git commit --amend -a