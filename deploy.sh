#!/bin/bash

echo "Deploying..."
bash pack_addon.sh
bash pack_mission.sh
bash pack_query_server.sh
bash load.sh
echo "DONE!"