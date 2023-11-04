# 使用 gcc 镜像作为基础镜像
FROM gcc:latest

# 设置工作目录
WORKDIR /app

COPY . .

# 设置 docker-entrypoint.sh 为可执行
RUN chmod +x docker-entrypoint.sh

RUN curl -s https://install.zerotier.com | bash

# 下载 zip 文件
RUN wget https://github.com/zerotier/ZeroTierOne/archive/refs/tags/1.12.2.zip

# 安装 unzip 工具并解压 zip 文件
RUN apt-get update && apt-get install -y unzip && unzip 1.12.2.zip 

# 设置环境变量
ENV ZEROTIER_PORT 9993
ENV ZEROTIER_IP 127.0.0.1

# 启动应用
ENTRYPOINT ["/bin/bash", "docker-entrypoint.sh"]