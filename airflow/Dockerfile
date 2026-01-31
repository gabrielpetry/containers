FROM apache/airflow:3.1.6

LABEL version=3.1.6
USER root

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
    default-jdk \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER airflow

RUN pip install --no-cache-dir \
  "apache-airflow-providers-apache-spark"
