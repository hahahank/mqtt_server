# 定义镜像名称和容器名称
IMAGE_NAME = mymqtt-image
CONTAINER_NAME = mymqtt-app

# 构建镜像
build:
	docker build -t $(IMAGE_NAME) .
	docker images
# 运行容器
run:
	docker run -d -p 1883:1883 --name $(CONTAINER_NAME) \
	$(IMAGE_NAME)


login:
	docker ps -a
	docker exec -it $(CONTAINER_NAME) bash

# 停止容器
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

# 清除所有已停止的容器和未使用的镜像（慎用！）
#clean:#
#       docker system prune -f
