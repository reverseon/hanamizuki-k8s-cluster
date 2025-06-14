#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
FOLDER=$1
PATCH=$2

if [ -z "$FOLDER" ] || [ -z "$PATCH" ]; then
    echo "Usage: $0 <folder> <patch>"
    exit 1
fi

if [ ! -d "$FOLDER" ]; then
    echo "Folder $FOLDER does not exist"
    exit 1
fi

if [ ! -d "$FOLDER/patches/$PATCH" ]; then
    echo "Patch $PATCH does not exist"
    exit 1
fi

helmfile -f $FOLDER/patches/$PATCH/helmfile.yaml template --include-crds > $FOLDER/patches/$PATCH/helm-$FOLDER.yaml