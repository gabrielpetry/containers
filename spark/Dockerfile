FROM spark:4.0.1-scala2.13-java21-python3-ubuntu

LABEL maintainer="Gabriel Petry"
LABEL version="4.0.1"
LABEL app="spark"


# Download Iceberg Spark runtime for Spark 4.0
RUN curl -L -o /opt/spark/jars/iceberg-spark-runtime-4.0_2.12-1.5.0.jar \
    https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-4.0_2.12/1.5.0/iceberg-spark-runtime-4.0_2.12-1.5.0.jar

# Download AWS SDK and S3A for S3 access
RUN curl -L -o /opt/spark/jars/aws-java-sdk-bundle-1.12.262.jar \
    https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar && \
    curl -L -o /opt/spark/jars/hadoop-aws-3.4.2.jar \
    https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.4.2/hadoop-aws-3.4.2.jar

# Install git for git-sync (if needed for any operations)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Create directory for git-synced scripts
RUN mkdir -p /opt/spark/git-scripts

# Copy configuration
COPY iceberg.properties /opt/spark/conf/
COPY spark-defaults.conf /opt/spark/conf/
