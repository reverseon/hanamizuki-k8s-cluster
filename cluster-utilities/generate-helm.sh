#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
CATEGORY=$1
FOLDER=$2
PATCH=$3

if [ -z "$CATEGORY" ] || [ -z "$FOLDER" ] || [ -z "$PATCH" ]; then
    echo "Usage: $0 <category> <folder> <patch>"
    exit 1
fi

if [ ! -d "$CATEGORY/$FOLDER" ]; then
    echo "Folder $CATEGORY/$FOLDER does not exist"
    exit 1
fi

if [ ! -d "$CATEGORY/$FOLDER/patches/$PATCH" ]; then
    echo "Patch $PATCH does not exist"
    exit 1
fi

helmfile -f $CATEGORY/$FOLDER/patches/$PATCH/helmfile.yaml template --include-crds > $CATEGORY/$FOLDER/patches/$PATCH/helm-$FOLDER.yaml