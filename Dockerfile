FROM alpine:3.4

ENV ELASTICSEARCH_HOST logs.fite.lan

RUN apk add --no-cache bash python python-dev openssl py-pip gettext && \
    wget "https://bootstrap.pypa.io/get-pip.py" -O /dev/stdout | python && \
    pip install elasticsearch-curator
    
ADD curator.yml /root/curator.yml
ADD config.yml /root/config.yml

RUN  /bin/sed -i s/{HOST_ADDRESS}/${ELASTICSEARCH_HOST}/ /root/config.yml

ENTRYPOINT ["curator", "--config", "/root/config.yml", "/root/curator.yml"]
