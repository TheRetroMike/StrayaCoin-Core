FROM ubuntu:focal
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install wget unzip libssl-dev libdb++-dev libboost-all-dev build-essential pkg-config bsdmainutils -y
COPY . /usr/src/strayacoin
WORKDIR /usr/src/strayacoin
RUN ./autogen.sh
RUN ./configure --with-incompatible-bdb
RUN make
RUN mv /usr/src/strayacoin/src/strayacoind /usr/bin/strayacoind
RUN mv /usr/src/strayacoin/src/strayacoin-cli /usr/bin/strayacoin-cli
CMD ["/usr/bin/strayacoind", "--printtoconsole"]
#RUN mv /usr/src/strayacoin/src/2204-spiderbyted /usr/bin/spiderbyted
#WORKDIR /opt/
#RUN wget https://github.com/Crypto-Currency/SpiderByte/raw/refs/heads/master/release/2204-spiderbyted
#RUN chmod +x 2204-spiderbyted
#RUN mv 2204-spiderbyted /usr/bin/spiderbyted
#CMD /usr/bin/spiderbyted --daemon;tail -f /root/.SpiderByte/debug.log







#FROM ubuntu:14.04

#COPY ./strayacoin.conf /root/.strayacoin/strayacoin.conf
#COPY . /usr/src/strayacoin

#WORKDIR /usr/src/strayacoin

#RUN ./build-all.sh

#EXPOSE 9666 19666

#CMD ["strayacoind", "--printtoconsole"]
