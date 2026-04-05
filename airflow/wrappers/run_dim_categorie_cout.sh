#!/bin/bash
set -euo pipefail
bash /opt/airflow/wrappers/start_pg_proxy.sh
bash /opt/airflow/wrappers/prepare_windows_paths.sh /opt/airflow/talend_jobs/scouts/Dim_Categorie_Cout
cd /opt/airflow/talend_jobs/scouts/Dim_Categorie_Cout
chmod +x ./Dim_Categorie_Cout_run.sh
echo "=== START Dim_Categorie_Cout ==="
./Dim_Categorie_Cout_run.sh
echo "=== END Dim_Categorie_Cout ==="
