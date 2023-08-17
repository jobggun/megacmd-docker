FROM debian:bookworm-slim

ARG MEGACMD_DEB_URL=https://mega.nz/linux/repo/Debian_12/amd64/megacmd-Debian_12_amd64.deb
ARG MEGACMD_DEB_FILE=megacmd-Debian_12_amd64.deb

RUN apt update && \
    apt -y install wget && \
    wget "$MEGACMD_DEB_URL" -O "/tmp/$MEGACMD_DEB_FILE" && \
	apt -y install "/tmp/$MEGACMD_DEB_FILE" && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

CMD [ "mega-cmd" ]
