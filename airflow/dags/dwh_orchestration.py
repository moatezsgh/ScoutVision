import pendulum
from datetime import timedelta
from airflow.sdk import DAG
from airflow.providers.standard.operators.bash import BashOperator

local_tz = pendulum.timezone("Africa/Tunis")

default_args = {
    "owner": "moatez",
    "depends_on_past": False,
    "retries": 2,
    "retry_delay": timedelta(minutes=5),
    "execution_timeout": timedelta(minutes=30),
}

with DAG(
    dag_id="dwh_orchestration",
    description="Orchestration DWH Scouts avec jobs Talend exportés Linux",
    start_date=pendulum.datetime(2026, 4, 5, 8, 0, tz=local_tz),
    end_date=pendulum.datetime(2026, 4, 14, 8, 0, tz=local_tz),
    schedule="0 8 * * *",
    catchup=False,
    default_args=default_args,
    max_active_runs=1,
    dagrun_timeout=timedelta(hours=2),
    tags=["dwh", "talend", "scouts", "prod"],
) as dag:

    start = BashOperator(
        task_id="start",
        bash_command="echo 'Début orchestration DWH'"
    )

    dim_adherent = BashOperator(
        task_id="dim_adherent",
        bash_command="bash /opt/airflow/wrappers/run_dim_adherent.sh "
    )

    dim_categorie_cout = BashOperator(
        task_id="dim_categorie_cout",
        bash_command="bash /opt/airflow/wrappers/run_dim_categorie_cout.sh "
    )

    dim_host = BashOperator(
        task_id="dim_host",
        bash_command="bash /opt/airflow/wrappers/run_dim_host.sh "
    )

    dim_saison = BashOperator(
        task_id="dim_saison",
        bash_command="bash /opt/airflow/wrappers/run_dim_saison.sh "
    )

    dim_type_camp = BashOperator(
        task_id="dim_type_camp",
        bash_command="bash /opt/airflow/wrappers/run_dim_type_camp.sh "
    )

    fact_budget_camp = BashOperator(
        task_id="fact_budget_camp",
        bash_command="bash /opt/airflow/wrappers/run_fact_budget_camp.sh "
    )

    fact_exchange = BashOperator(
        task_id="fact_exchange",
        bash_command="bash /opt/airflow/wrappers/run_fact_exchange.sh "
    )

    end = BashOperator(
        task_id="end",
        bash_command="echo 'Fin orchestration DWH'"
    )

    start >> dim_adherent >> dim_categorie_cout >> dim_host >> dim_saison >> dim_type_camp
    dim_type_camp >> fact_budget_camp
    dim_type_camp >> fact_exchange
    [fact_budget_camp, fact_exchange] >> end
