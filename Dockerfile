FROM ubuntu:18.04
RUN mkdir /setup
COPY ./*.sh /setup/
RUN chmod +x /setup/*.sh
RUN /setup/1.sh
COPY ./heketi.json /etc/heketi/
COPY ./topology.json /etc/heketi/
COPY ./heketi /etc/init.d/
COPY ./healthy /etc/heketi/