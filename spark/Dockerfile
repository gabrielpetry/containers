FROM spark:3.5.7-scala2.12-java17-python3-ubuntu

LABEL maintainer="Gabriel Petry"
LABEL version="3.5.7"
LABEL app="spark"

# Set versions as variables for easier maintenance
ARG SPARK_VERSION=3.5
ARG SCALA_VERSION=2.12
ARG ICEBERG_VERSION=1.10.1
ARG HADOOP_VERSION=3.3.4
ARG AWS_SDK_VERSION=1.12.797
ARG NESSIE_VERSION=0.106.0

USER root

COPY install-deps.sh /bin/install-deps.sh
RUN chmod +x /bin/install-deps.sh

RUN /bin/install-deps.sh \
    "https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.12/1.10.1/iceberg-spark-runtime-3.5_2.12-1.10.1.jar" \
    "https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-aws-bundle/1.10.1/iceberg-aws-bundle-1.10.1.jar" \
    "https://repo1.maven.org/maven2/org/projectnessie/nessie-integrations/nessie-spark-extensions-3.5_2.12/0.106.0/nessie-spark-extensions-3.5_2.12-0.106.0.jar" \
    "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar" \
    "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar" \
    "https://repo1.maven.org/maven2/org/apache/sedona/sedona-spark-shaded-3.5_2.12/1.6.1/sedona-spark-shaded-3.5_2.12-1.6.1.jar" \
    "https://repo1.maven.org/maven2/org/datasyslab/geotools-wrapper/1.6.1-28.2/geotools-wrapper-1.6.1-28.2.jar"

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
