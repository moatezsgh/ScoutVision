#!/bin/bash
set -euo pipefail
bash /opt/airflow/wrappers/start_pg_proxy.sh
bash /opt/airflow/wrappers/prepare_windows_paths.sh /opt/airflow/talend_jobs/scouts/Fact_Budget_Camp
cd /opt/airflow/talend_jobs/scouts/Fact_Budget_Camp
chmod +x ./Fact_Budget_Camp_run.sh
echo "=== START Fact_Budget_Camp ==="
./Fact_Budget_Camp_run.sh
echo "=== END Fact_Budget_Camp ==="
