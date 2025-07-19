#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
FOLDER=$1
PATCH=$2

if [ ! -d "$SCRIPT_DIR/$FOLDER" ]; then
    echo "Folder $SCRIPT_DIR/$FOLDER does not exist"
    exit 1
fi

if [ ! -d "$SCRIPT_DIR/$FOLDER/patches/$PATCH" ]; then
    echo "Patch $PATCH does not exist"
    exit 1
fi

helmfile -f $SCRIPT_DIR/$FOLDER/patches/$PATCH/helmfile.yaml template --include-crds > $SCRIPT_DIR/$FOLDER/patches/$PATCH/helm-$FOLDER.yaml