FROM debian:latest
RUN apt update && apt upgrade -y && \
    apt install -y curl gpg ca-certificates tar dirmngr git cmake build-essential \
    libtool autotools-dev automake pkg-config libssl-dev \
    libevent-dev bsdmainutils python3 libboost-system-dev \
    libboost-filesystem-dev libboost-chrono-dev \
    libboost-program-options-dev libboost-test-dev \
    libboost-thread-dev libminiupnpc-dev libzmq3-dev \
    software-properties-common libdb++-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /src
RUN git clone https://github.com/pepecoinppc/pepecoin.git && \
    cd pepecoin && \
    ./autogen.sh && \
    ./configure && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    rm -rf pepecoin

EXPOSE 33874 33873
CMD ["pepecoind", "-printtoconsole"]

LABEL name="pepecoin-node" \
      description="Pepecoin core container based off Debian"