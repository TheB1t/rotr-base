#!/bin/bash

MISSION_DYNAMIC_DIR="mission/dynamic_scripts"

OUTPUT_DIR="output"
QUERY_SERVER_OUTPUT_DIR="${OUTPUT_DIR}/query_server"

# Query server packing
rm -rf ${QUERY_SERVER_OUTPUT_DIR}
mkdir ${QUERY_SERVER_OUTPUT_DIR}

cp -r ${OUTPUT_DIR}/*Server ${QUERY_SERVER_OUTPUT_DIR}
cp -r ${MISSION_DYNAMIC_DIR}/* ${QUERY_SERVER_OUTPUT_DIR}