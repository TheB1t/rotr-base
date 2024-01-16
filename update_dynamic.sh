#!/bin/bash

MACHINE="arma3server@workserv2"

MISSION_DYNAMIC_DIR="mission/dynamic_scripts"

scp -r ${MISSION_DYNAMIC_DIR}/* ${MACHINE}:~/query_server