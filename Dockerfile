FROM debian:latest

COPY sources.list /etc/apt/

RUN apt update && \
    apt install -y wget procps && \
    wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-4.0.0.tgz && \
    tar zxf mongodb-linux-x86_64-4.0.0.tgz && \
    mv mongodb-linux-x86_64-4.0.0 /usr/local/mongodb && \
    rm -rf mongodb-linux-x86_64-4.0.0.tgz && \
    mkdir -p /data/db/ && \
    mkdir /usr/local/mongodb/conf

COPY mongo.conf /usr/local/mongodb/conf/

ENV WORK_PATH /usr/local/
ENV PATH=$WORK_PATH/mongodb/bin:$PATH

CMD /usr/local/mongodb/bin/mongod -f /usr/local/mongodb/conf/mongo.conf && tail -f /data/db/mongo.log
