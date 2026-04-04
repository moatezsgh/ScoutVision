#!/bin/bash
set -euo pipefail
bash /opt/airflow/wrappers/start_pg_proxy.sh
bash /opt/airflow/wrappers/prepare_windows_paths.sh /opt/airflow/talend_jobs/scouts/Dim_Host
cd /opt/airflow/talend_jobs/scouts/Dim_Host
chmod +x ./Dim_Host_run.sh
echo "=== START Dim_Host ==="
./Dim_Host_run.sh
echo "=== END Dim_Host ==="
