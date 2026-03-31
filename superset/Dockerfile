FROM docker.io/apache/superset:6.0.0

LABEL maintainer="Gabriel Petry"
LABEL version="6.0.0"
LABEL app="superset"

USER root

RUN \
    apt-get update && \
    apt-get install -y gcc g++

RUN \
    . .venv/bin/activate && \
    uv pip install \
    "apache-superset[trino]" \
    psycopg2-binary \
    openpyxl \
    Pillow \
    trino

RUN \
    apt-get -y purge gcc g++

USER superset

CMD ["/app/docker/entrypoints/run-server.sh"]
