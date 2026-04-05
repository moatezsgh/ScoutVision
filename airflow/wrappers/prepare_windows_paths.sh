#!/bin/bash
set -euo pipefail

JOB_DIR="$1"

mkdir -p "$JOB_DIR/C:/Users/moate/Desktop"
ln -sfn /opt/airflow/extern_data "$JOB_DIR/C:/Users/moate/Desktop/ExternData"

echo "Fake Windows path ready in: $JOB_DIR/C:/Users/moate/Desktop/ExternData"
