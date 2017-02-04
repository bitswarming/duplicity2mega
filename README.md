# duplicity2mega
Since [mega.py](https://github.com/richardasaurus/mega.py) is broken here is docker based replacement

`docker pull bitswarming/duplicity2mega`

`sudo docker-compose  -f docker-compose.yml up -d`

`sudo docker exec -it megafuse bash -c /root/backup.sh`

`sudo docker exec -it megafuse bash -c /root/configs/list.sh`

`sudo docker exec -it megafuse bash -c /root/verify.sh`

`sudo docker exec -it megafuse /root/configs/restore.sh "Sat Feb  4 16:53:38 2017"`

`sudo docker logs  -f  megafuse`

bitswarming/duplicity2mega
