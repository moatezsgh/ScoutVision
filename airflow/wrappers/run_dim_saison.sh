#!/bin/bash
set -euo pipefail
bash /opt/airflow/wrappers/start_pg_proxy.sh
bash /opt/airflow/wrappers/prepare_windows_paths.sh /opt/airflow/talend_jobs/scouts/Dim_Saison
cd /opt/airflow/talend_jobs/scouts/Dim_Saison
chmod +x ./Dim_Saison_run.sh
echo "=== START Dim_Saison ==="
./Dim_Saison_run.sh
echo "=== END Dim_Saison ==="
