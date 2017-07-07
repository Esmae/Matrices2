if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Starting to update testingUpload\n"

  cp -R test8 $HOME

  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  git clone --quiet --branch=testingUpload https://${TOKEN}@github.com/Esmae/Matrices2.git  testingUpload > /dev/null

  cd testingUpload
  cp -Rf $HOME/test8

  git add -f .
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to testingUpload"
  git push -fq origin testingUpload > /dev/null

  echo -e "Success? \n"
fi
