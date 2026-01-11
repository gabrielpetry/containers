FROM spark:4.0.1-scala2.13-java21-python3-ubuntu

LABEL maintainer="Gabriel Petry"
LABEL version="4.0.1"
LABEL app="spark"

# Set versions as variables for easier maintenance
ARG ICEBERG_VERSION=1.5.0
ARG HADOOP_VERSION=3.4.0
ARG AWS_SDK_VERSION=1.12.767

USER root

# 1. Download Iceberg Spark runtime (MATCHING Scala 2.13)
RUN curl -L -o /opt/spark/jars/iceberg-spark-runtime-4.0_2.13-${ICEBERG_VERSION}.jar \
    https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-4.0_2.13/${ICEBERG_VERSION}/iceberg-spark-runtime-4.0_2.13-${ICEBERG_VERSION}.jar

# 2. Download AWS SDK and S3A (Ensure compatibility with Hadoop 3.x)
RUN curl -L -o /opt/spark/jars/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar \
    https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/${AWS_SDK_VERSION}/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar && \
    curl -L -o /opt/spark/jars/hadoop-aws-${HADOOP_VERSION}.jar \
    https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/${HADOOP_VERSION}/hadoop-aws-${HADOOP_VERSION}.jar

# 3. Install git and clean up in one layer to keep image small
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# 4. Setup directories
RUN mkdir -p /opt/spark/git-scripts && \
    chown -R spark:spark /opt/spark/git-scripts

# 5. Copy configuration
COPY --chown=spark:spark iceberg.properties /opt/spark/conf/
COPY --chown=spark:spark spark-defaults.conf /opt/spark/conf/

USER spark
