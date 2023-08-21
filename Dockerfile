FROM ubuntu:20.04
LABEL maintainer="yang.hank@inventec.com"
#ENV PYTHONUNBUFFERED 1

# Install DEBUG TOOL
RUN apt update -y
#RUN apt-get install -y iputils-ping
RUN apt install -y nano

# set display port to avoid crash
ENV DISPLAY=:99
ENV PATH=/usr/local/lib/python3.8/site-packages:$PATH


## 2 MQTT service
RUN apt-get install -y mosquitto
# 将 Mosquitto 配置文件复制到容器中
COPY config/mosquitto.conf /etc/mosquitto/mosquitto.conf
# 可选：如果需要添加用户验证，可以复制 passwd 和 acl 文件
# COPY passwd /etc/mosquitto/passwd
# COPY acl /etc/mosquitto/acl
# 暴露 Mosquitto 使用的 MQTT 端口（默认是 1883）
EXPOSE 1883

## RUN
# 使用 Supervisor 来同时启动 Mosquitto 和 Flask
#RUN apt-get install -y supervisor
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#CMD ["supervisord", "-n"]
CMD mosquitto -c /etc/mosquitto/mosquitto.conf
