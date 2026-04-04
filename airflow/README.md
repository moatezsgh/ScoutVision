# Airflow Orchestration

This folder contains the Airflow orchestration layer for the ScoutVision project.

## Included
- `dags/` : orchestration DAGs
- `wrappers/` : shell wrappers to execute Talend exported jobs
- `Dockerfile` : custom Airflow image with Java and required tools
- `docker-compose.yaml` : local Airflow setup

## Notes
Sensitive runtime files, raw external data, and exported Talend execution bundles are excluded from version control.
