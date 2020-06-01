#!/bin/bash
set -e
#gitbranch=$(git rev-parse --abbrev-ref HEAD)

if [ "${GIT_BRANCH}" == "master" ]
then
  echo on master branch - publish can proceed

  ./gendoc.sh docs

  ziti-ci configure-git
  git add docs docfx_project/ziti-*
  git commit -m "[ci skip] publish docs from travis"
  git push

else
  echo ========= cannot publish from branch that is not master : ${GIT_BRANCH}
  echo ========= publish considered successful though no op
fi