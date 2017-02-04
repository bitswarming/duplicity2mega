FROM ubuntu:14.04
MAINTAINER Bit <bitswarming@gmail.com>
# sudo docker build -t bitswarming/megafuse --no-cache=true .
ENV DEBIAN_FRONTEND=noninteractive
#ARG MOUNTPOINT
#RUN echo "$MOUNTPOINT"
#RUN echo "$PASSWORD"
RUN sed -i -e '/^deb-src/ s/^/#/' /etc/apt/sources.list && \
echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
echo "Acquire::http {No-Cache=True;}" > /etc/apt/apt.conf.d/no-cache && \
apt-get update && \
apt-get -qy dist-upgrade && \
apt-get install -y libcrypto++-dev libcurl4-openssl-dev libfreeimage-dev libreadline-dev libfuse-dev libdb++-dev duplicity git g++ make && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
git clone https://github.com/matteoserva/MegaFuse && \
cd MegaFuse && \
make &&\
make install
#COPY backup.sh /root/backup.sh
#COPY list.sh /root/list.sh
#COPY verify.sh /root/verify.sh
#COPY restore.sh /root/restore.sh
#RUN chmod +x /root/backup.sh
#RUN chmod +x /root/list.sh
#RUN chmod +x /root/verify.sh
#RUN chmod +x /root/restore.sh
#mkdir /mega_tri
#RUN mkdir "${MOUNTPOINT}"
