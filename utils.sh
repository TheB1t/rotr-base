#!/bin/bash

MACHINE="arma3server@workserv2"

ADDON_NAME="A3RE"

MISSION_NAME="ROTR_General_Mission"
MISSION_MAP="vt7"

SERVER_ADDON_FOLDER="servermods"
SERVER_QUERY_SERVER_FOLDER="query_server"

ADDON_MODULE_DIR="modules/addon"
MISSION_STATIC_DIR="mission/static_scripts"
MISSION_DYNAMIC_DIR="mission/dynamic_scripts"

TEMP_DIR="tmp"
OUTPUT_DIR="output"

QUERY_SERVER_OUTPUT_DIR="${OUTPUT_DIR}/query_server"

MISSION_OUTPUT_DIR="${OUTPUT_DIR}/missions"

MISSION_FULL_NAME="${MISSION_NAME}.${MISSION_MAP}"


#
#   COLORS
#
NOCOLOR='\033[0m';    RED='\033[0;31m';    GREEN='\033[0;32m'
ORANGE='\033[0;33m';  BLUE='\033[0;34m';    PURPLE='\033[0;35m'
CYAN='\033[0;36m';    YELLOW='\033[1;33m';  WHITE='\033[1;37m'
GRAY='\033[0;90m'

#
#   LOG LEVELS
#
LOG_INFO="${GREEN}[INFO]"
LOG_WARN="${YELLOW}[WARN]"
LOG_ERROR="${RED}[ERROR]"
LOG_DIFF="${CYAN}[DIFF]"

#   Function for pretty logs
function log() {
  declare -n level=$1; local message=$2
  echo -e "${level} ${ORANGE}${message}${NOCOLOR}"
}

function pack_addon() {
    local NAME=$1;

    ADDON_ROOT_FOLDER="@${NAME}"

    log LOG_INFO "Packing addon ${ADDON_ROOT_FOLDER}"

    mkdir ${TEMP_DIR}

    # Addon packing
    rm -rf ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}
    mkdir ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}
    mkdir ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}/addons

    cd ${TEMP_DIR}

    mkdir ${NAME}
    cp -r ../${ADDON_MODULE_DIR}/src/* ${NAME}
    pbo_unpacker pack ${NAME} 1>/dev/null
    rename 'y/A-Z/a-z/' ${NAME}.pbo

    cd -

    mv ${TEMP_DIR}/*.pbo ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}/addons
    cp ${ADDON_MODULE_DIR}/*.cfg ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}
    cp ${OUTPUT_DIR}/*.so ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}
    cp ${OUTPUT_DIR}/*.dll ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER}

    rm -rf ${TEMP_DIR}
}

function pack_mission() {
    local NAME=$1;

    log LOG_INFO "Packing mission ${NAME}"

    MISSION_FOLDER="${MISSION_OUTPUT_DIR}/${NAME}"

    rm -rf ${MISSION_FOLDER}
    mkdir ${MISSION_OUTPUT_DIR}
    mkdir ${MISSION_FOLDER}

    cp -r ${ADDON_MODULE_DIR}/mission/mission_scripts/* ${MISSION_FOLDER}
    cp -r ${MISSION_STATIC_DIR}/* ${MISSION_FOLDER}

    cd ${MISSION_OUTPUT_DIR}
    pbo_unpacker pack ${NAME} 1>/dev/null
    rm -rf ${NAME}

    cd - 1>/dev/null
}

function pack_query_server() {
    log LOG_INFO "Packing query_server"

    rm -rf ${QUERY_SERVER_OUTPUT_DIR}
    mkdir ${QUERY_SERVER_OUTPUT_DIR}

    cp -r ${OUTPUT_DIR}/*Server ${QUERY_SERVER_OUTPUT_DIR}
    cp -r ${MISSION_DYNAMIC_DIR}/* ${QUERY_SERVER_OUTPUT_DIR}
}

function load_addon() {
    local NAME=$1; local FOLDER_NAME=$2

    log LOG_INFO "Uploading addon to ${FOLDER_NAME}"

    ADDON_ROOT_FOLDER="@${NAME}"

    ssh ${MACHINE} "rm -rf ~/serverfiles/${FOLDER_NAME}/${ADDON_ROOT_FOLDER}/"
    scp -r ${OUTPUT_DIR}/${ADDON_ROOT_FOLDER} ${MACHINE}:~/serverfiles/${FOLDER_NAME} 1>/dev/null
}

function load_mission() {
    local NAME=$1

    log LOG_INFO "Uploading mission to ${NAME}.pbo"
    scp ${OUTPUT_DIR}/missions/${NAME}.pbo ${MACHINE}:~/serverfiles/mpmissions 1>/dev/null
}

function load_query_server() {
    local FOLDER_NAME=$1

    log LOG_INFO "Uploading query server to ${FOLDER_NAME}"

    ssh ${MACHINE} "mkdir ~/${FOLDER_NAME}"
    ssh ${MACHINE} "rm -rf ~/${FOLDER_NAME}/*"
    scp -r ${OUTPUT_DIR}/query_server/* ${MACHINE}:~/${FOLDER_NAME} 1>/dev/null
}

function main() {
    local action=$1; shift

    case "$action" in
        "deploy")
                log LOG_INFO "Deploying..."
                pack_addon ${ADDON_NAME}
                pack_mission ${MISSION_FULL_NAME}
                pack_query_server

                load_addon ${ADDON_NAME} "${SERVER_ADDON_FOLDER}"
                load_mission "${MISSION_FULL_NAME}"
                load_query_server "${SERVER_QUERY_SERVER_FOLDER}"
                log LOG_INFO "DONE!"
                ;;

        "deploy_test")
                log LOG_INFO "Deploying test..."
                pack_addon ${ADDON_NAME}
                pack_mission "test_${MISSION_FULL_NAME}"
                pack_query_server

                load_addon ${ADDON_NAME} "${SERVER_ADDON_FOLDER}_test"
                load_mission "test_${MISSION_FULL_NAME}"
                load_query_server "${SERVER_QUERY_SERVER_FOLDER}_test"


                ADDON_ROOT_FOLDER="@${ADDON_NAME}"
                scp -r test/*.cfg ${MACHINE}:~/serverfiles/${SERVER_ADDON_FOLDER}_test/${ADDON_ROOT_FOLDER} 1>/dev/null
                log LOG_INFO "DONE!"
                ;;

        "sync_modules")
                git submodule foreach git fetch
                git submodule foreach git checkout main
                git submodule foreach git reset --hard origin/main
                ;;

            *)
                [[ -n "$action" ]] && echo "Not implemented action $1" || echo "Action not passed"
                ;;
    esac

}

main $@