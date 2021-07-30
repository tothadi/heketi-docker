for i in dm_snapshot dm_mirror dm_thin_pool; do
  modprobe $i
done


mkdir /root/.ssh
ssh-keygen -f /etc/heketi/heketi_key -t rsa -N ''
chown heketi:heketi /etc/heketi/heketi_key*

# for i in 10.42.0.1 10.42.1.1 10.42.2.1; do
#   ssh-copy-id -i /etc/heketi/heketi_key.pub root@$i
# done
