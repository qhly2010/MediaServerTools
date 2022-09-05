#!/bin/bash

ln -sf /usr/share/zoneinfo/$TZ   /etc/localtime
echo $TZ > /etc/timezone

function setting {

mkdir -p /opt/config
touch /opt/config/config.yaml

cat > /opt/config/config.yaml <<EOF
system:
  #EMBY 域名 包含http(s)和端口号后面不带/
  #例如https://xxx.xxx.xxx:8920
  embyhost: ''
  #EMBY 用户ID 进EMBY 用户点击管理员账号配置可以在网址上看到userId
  embyuserid: ''
  #EMBY APIKEY
  embykey: ''
  #TMDB APIKEY
  tmdbkey: ''
  #豆瓣 APIKEY
  doubankey: ''
  #线程数量
  threadnum: 2
  #是否刷新人名
  updatepeople: True
  #是否更新概述
  updateoverview: True
  #每次刷新全部媒体间隔时间 [小时]
  updatetime: 1
EOF

}

if [ ! -f /opt/config/config.yaml ]; then
	setting
fi

cd /opt
python3 main.py
