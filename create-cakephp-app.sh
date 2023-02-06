#!/bin/sh

# Usage
usage() {
    echo "Usage: \r"
    echo "create-cake-project <project_path> [version]"
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi 

PROJECT_PATH=$1
DIR_PATH=$(dirname $PROJECT_PATH)
PROJECT_NAME=$(basename $PROJECT_PATH)

if ! [[ -d  "$DIR_PATH" ]]
then
    echo "$DIR_PATH does not exist on your filesystem."
    exit 1
fi

if [ "$2" ]; then
    VERSION=$2
else
    VERSION=3.8
fi

echo CakePHP version: $VERSION
echo Root path: $DIR_PATH
echo Project directory: $PROJECT_NAME

composer create-project --prefer-dist "cakephp/app:$VERSION" $PROJECT_PATH
