#!/bin/bash

ADDON_MODULE_DIR="modules/addon"

TEMP_DIR="tmp"
OUTPUT_DIR="output"
ADDON_NAME="A3RE"
ADDON_ROOT_FOLDER="@${ADDON_NAME}"

mkdir ${TEMP_DIR}

# Addon packing
rm -rf ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}
mkdir ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}
mkdir ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}/addons

cd ${TEMP_DIR}

mkdir ${ADDON_NAME}
cp -r ../${ADDON_MODULE_DIR}/src/* ${ADDON_NAME}
pbo_unpacker pack ${ADDON_NAME}
rename 'y/A-Z/a-z/' ${ADDON_NAME}.pbo

cd ..

mv ${TEMP_DIR}/*.pbo ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}/addons
cp ${ADDON_MODULE_DIR}/*.cfg ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}
cp ${OUTPUT_DIR}/*.so ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}

rm -rf ${TEMP_DIR}