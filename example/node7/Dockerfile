FROM ubuntu:latest

ENV QUORUM_BUILD_URL https://dotjsonquorum.blob.core.windows.net/builds/quorumcon-alpha-1.0.5.zip
ENV QUORUM_ZIP_FILE quorumcon-alpha-1.0.5.zip

COPY node/ /node/

RUN apt-get update && \
    apt-get install -y --no-install-recommends libdb-dev libsodium-dev zlib1g-dev libtinfo-dev ca-certificates libgmp3-dev unzip wget && \
    wget ${QUORUM_BUILD_URL} && \
    unzip ${QUORUM_ZIP_FILE} -d quorum && \
    cd quorum && \
    chmod +x .artifacts/* && \
    mv .artifacts/* /usr/local/bin && \
    cd / && \
    rm -rf ${QUORUM_ZIP_FILE} quorum && \
    chmod +x /node/template/init.sh /node/gethbootstrap.sh

WORKDIR /node

ENTRYPOINT ["./template/init.sh"]


