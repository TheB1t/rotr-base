#!/bin/bash

MACHINE="arma3server@workserv2"

OUTPUT_DIR="output"

ssh ${MACHINE} "rm -rf ~/serverfiles/servermods/\@A3RE/"
ssh ${MACHINE} "rm -rf ~/query_server"

scp ${OUTPUT_DIR}/missions/*.pbo ${MACHINE}:~/serverfiles/mpmissions
scp -r ${OUTPUT_DIR}/\@A3RE ${MACHINE}:~/serverfiles/servermods
scp -r ${OUTPUT_DIR}/query_server ${MACHINE}:~/