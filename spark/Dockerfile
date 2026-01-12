FROM spark:3.5.7-scala2.12-java17-python3-ubuntu

LABEL maintainer="Gabriel Petry"
LABEL version="3.5.7"
LABEL app="spark"

# Set versions as variables for easier maintenance
ARG ICEBERG_VERSION=1.6.1
ARG HADOOP_VERSION=3.3.4
ARG AWS_SDK_VERSION=1.12.767
ARG NESSIE_VERSION=0.105.7

USER root

COPY install-deps.sh /bin/install-deps.sh
RUN chmod +x /bin/install-deps.sh


RUN /bin/install-deps.sh \
    https://repo1.maven.org/maven2/org/projectnessie/nessie-integrations/nessie-spark-extensions-4.0_2.13/${NESSIE_VERSION}/nessie-spark-extensions-4.0_2.13-${NESSIE_VERSION}.jar \
    https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-4.0_2.13/${ICEBERG_VERSION}/iceberg-spark-runtime-4.0_2.13-${ICEBERG_VERSION}.jar \
    https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/${AWS_SDK_VERSION}/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar \
    https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/${HADOOP_VERSION}/hadoop-aws-${HADOOP_VERSION}.jar

# 4. Setup directories
RUN mkdir -p /opt/spark/git-scripts && \
    chown -R spark:spark /opt/spark/git-scripts

USER spark
