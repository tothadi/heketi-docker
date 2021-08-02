for i in dm_snapshot dm_mirror dm_thin_pool; do
  modprobe $i
done

for i in 10.42.0.1 10.42.1.1 10.42.2.1; do
  ssh-copy-id -i /etc/heketi/heketi_key.pub root@$i
done

heketi-cli topology load --json=/etc/heketi/topology.json
heketi --config=/etc/heketi/heketi.json


chown -R heketi:heketi /var/lib/heketi /var/log/heketi /etc/heketi