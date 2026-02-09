FROM spark:3.5.7-scala2.12-java17-python3-ubuntu

LABEL maintainer="Gabriel Petry"
LABEL version="3.5.7"
LABEL app="spark"

# Set versions as variables for easier maintenance

USER root

# 4. Setup directories
RUN mkdir -p /opt/spark/git-scripts && \
    chown -R spark:spark /opt/spark/git-scripts


RUN pip install --no-cache-dir \
    apache-sedona \
    apache-sedona[spark] \
    geopandas \
    pandas \
    boto3 \
    pyarrow

USER spark