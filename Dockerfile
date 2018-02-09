FROM jboss/base-jdk:8

USER root

RUN yum update -y && \
yum install -y git && \
yum install -y net-tools && \
yum install -y openssl && \
rm -rf /var/cache/yum

RUN cd /usr/local/src && \
    git clone https://github.com/twitter/diffy.git && \
    cd diffy && \
    rm -rf .git && \
    ./sbt assembly && \
    mv target/scala-2.11 /opt/diffy && \
    groupadd -r diffy && \
    useradd -r -g diffy -d /opt/diffy diffy && \
    chown -R diffy:diffy /opt/diffy && \
    rm -r /usr/local/src/diffy

USER diffy

WORKDIR /opt/diffy

ENTRYPOINT ["java", "-jar", "/opt/diffy/diffy-server.jar"]
