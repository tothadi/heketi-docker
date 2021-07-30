FROM ubuntu:18.04
RUN mkdir /setup
COPY ./*.sh /setup/
RUN chmod +x /setup/*.sh
RUN /setup/1.sh
COPY ./heketi.json /etc/heketi/
RUN /setup/2.sh
COPY ./heketi.service /etc/systemd/system/
RUN systemctl daemon-reload
RUN systemctl enable --now heketi
RUN chown -R heketi:heketi /var/lib/heketi /var/log/heketi /etc/heketi
COPY ./topology.json /etc/heketi/
RUN heketi-cli topology load --json=/etc/heketi/topology.json