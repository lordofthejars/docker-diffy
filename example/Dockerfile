FROM jboss/base-jdk:8

RUN curl https://raw.githubusercontent.com/twitter/diffy/master/example/ExampleServers.java > ExampleServers.java && \
    javac ExampleServers.java 

EXPOSE 9000 
EXPOSE 9100
EXPOSE 9200
CMD java ExampleServers 9000 9100 9200
