#!/bin/bash
set -euo pipefail
bash /opt/airflow/wrappers/start_pg_proxy.sh
bash /opt/airflow/wrappers/prepare_windows_paths.sh /opt/airflow/talend_jobs/scouts/Fact_Exchange
cd /opt/airflow/talend_jobs/scouts/Fact_Exchange
chmod +x ./Fact_Exchange_run.sh
echo "=== START Fact_Exchange ==="
./Fact_Exchange_run.sh
echo "=== END Fact_Exchange ==="
