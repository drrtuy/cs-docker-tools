#!/bin/sh
CP_SRC_BRANCH=$1
SRC_BRANCH=$2
CP_DST_BRANCH=$3

. ~/.bashrc

cd_eng
git checkout ${CP_SRC_BRANCH}
TOP_COMMIT=$(git log --pretty=format:%H | head -n 1)

git checkout ${SRC_BRANCH}
git checkout -b ${CP_DST_BRANCH}
git cherry-pick ${TOP_COMMIT}
