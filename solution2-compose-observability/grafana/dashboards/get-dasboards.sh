#!/bin/bash

DASHBOARD_IDS=("3662" "1860" "9981" "14282")
DASHBOARD_PATH="./grafana/dashboards"

mkdir -p $DASHBOARD_PATH

for id in "${DASHBOARD_IDS[@]}"; do
  curl -s -o "${DASHBOARD_PATH}/${id}.json" "https://grafana.com/api/dashboards/${id}/revisions/latest/download"
done
