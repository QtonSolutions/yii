#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage:"
    echo "     package-business.sh <version>"
    echo "e.g. package-business.sh 101-develop"
    echo "e.g. package-business.sh 41-release-1.4.0"
    exit 1
fi

VERSION=$1

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
PROJECT_DIR=${SCRIPTPATH}/..

BUILD_DIR=${PROJECT_DIR}/build-jenkins
mkdir -p ${BUILD_DIR}
ZIP_FILE=${BUILD_DIR}/yii.business.${VERSION}.zip

rm -f ${ZIP_FILE}

zip -r --include=framework* ${ZIP_FILE} .
zip ${ZIP_FILE} LICENSE

exit 0
