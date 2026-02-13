FROM apache/airflow:3.1.7

LABEL version=3.1.7

USER root

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
  default-jdk \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER airflow


RUN --mount=type=cache,target=/home/airflow/.cache/pip \
  pip install --no-cache-dir \
  "pyspark==3.5.7" \
  "apache-airflow-providers-apache-spark==5.5.0" \
  "apache-sedona==1.8.1" \
  "apache-sedona[spark]" \
  "geopandas==1.1.2" \
  "pandas==3.0.0" \
  "boto3==1.42.39" \
  "pyarrow==23.0.0" \
  "apache-airflow-providers-trino==6.4.2"