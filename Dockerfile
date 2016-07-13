FROM alpine:3.4

RUN apk add --no-cache bash python python-dev openssl py-pip gettext && \
    wget "https://bootstrap.pypa.io/get-pip.py" -O /dev/stdout | python && \
    pip install elasticsearch-curator
    
ADD curator.yml /root/curator.yml
ADD config.yml /root/config.yml

# Launch Elastalert when a container is started.
ENTRYPOINT ["curator", "--config", "/root/config.yml", "/root/curator.yml"]
