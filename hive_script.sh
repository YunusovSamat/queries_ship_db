#!/bin/bash

# hdpFormat.sh
# hdpStart.sh
# hiveMeta.sh
# hiveStart.sh
cd ~/Documents/BigDataLab/ships_hive/
hdfs dfs -put *.txt /user/samat/warehouse/

beeline -u jdbc:hive2://localhost:10000 -n samat -f create_ships.sql

beeline -u jdbc:hive2://localhost:10000 -n samat -f select_tab.sql
