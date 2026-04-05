#!/bin/bash
set -euo pipefail
bash /opt/airflow/wrappers/start_pg_proxy.sh
bash /opt/airflow/wrappers/prepare_windows_paths.sh /opt/airflow/talend_jobs/scouts/Dim_Type_Camp
cd /opt/airflow/talend_jobs/scouts/Dim_Type_Camp
chmod +x ./Dim_Type_Camp_run.sh
echo "=== START Dim_Type_Camp ==="
./Dim_Type_Camp_run.sh
echo "=== END Dim_Type_Camp ==="
