FROM apache/airflow:3.1.8

USER root
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless socat procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

USER airflow
