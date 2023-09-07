FROM ubuntu:focal

# install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl gnupg lsb-release && \
    apt-get clean && \
    apt-get autoremove -y && \
    curl -LO https://github.com/ginuerzh/gost/releases/download/v2.11.2/gost-linux-amd64-2.11.2.gz && \
    gunzip gost-linux-amd64-2.11.2.gz && \
    mv gost-linux-amd64-2.11.2 /usr/bin/gost && \
    chmod +x /usr/bin/gost

COPY entrypoint.sh /entrypoint.sh

ENV GOST_ARGS="-L :1080"
ENV WARP_SLEEP=2

ENTRYPOINT ["/entrypoint.sh"]
