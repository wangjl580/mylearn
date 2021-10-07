我在ubutnu虚拟机中装了docker,mac 中没有
#想学习的话在ubuntu虚拟机中学习


#---学习记录
一个例子
#方法一：
sudo docker pull python #拉取python镜像，在dockerhub 服务器中
sudo docker container run -v /mnt/my_linux/soft_learn/Docker_learn/LearnDocker/mylearn/pytest:/workfolder:ro python:latest python /workfolder/main.py  #可以通过容器中的python运行本地py文件
#方法二
#编辑Dockerfile 文件如下内容
<<!
FROM python:latest
RUN pip install PyAutoGUI
COPY ./main.py ./main.py
CMD [ "python", "./main.py" ]
!
sudo docker build -t mypython_autogui:latest . #直接将main.py编译到镜像中mypython_autogui:latest
sudo docker container run -it mypython_autogui:latest #然后运行



#--
sudo docker image pull node:8.16.1  #获取node镜像
sudo docker image ls #查看已安装的镜像
#建立一个Node.js的运行环境(container/容器)
<<!
#FROM python:3.8
FROM python:3.8.0-alpine3.10

#RUN pip3 install numpy
#ENTRYPOINT ["python3"]  #可以指定进入点
RUN mkdir -p /workfolder
COPY ./main.py /workfolder/

CMD [ "python", "/workfolder/main.py" ]
!
sudo docker image build -t pytest:v01 . #编译打包我们的运行环境,t表示标签, #相当于类的实例化 或者sudo docker build -t pytest3:v05 .
sudo docker container run pytest:v01 # 在环境中运行我们的应用,或者sudo docker run pytest3:v05

#---此处需要先将镜像上传至docker hub: https://registry.hub.docker.com/repositories
sudo docker tag pytest:v01 wangjl580/pytest:v01 #打标签
sudo docker push wangjl580/pytest:v01

#---
#在另外的电脑上运行,取得运行环境，运行应用
sudo docker pull wangjl580/pytest:v01
sudo docker container run wangjl580/pytest:v01 #或者sudo docker run --name pytest3 wangjl580/pytest:v01 #--name pytest3 为指定名字运行容器，
sudo docker container rm -f pytest # 指定名字删除容器，或者用container id ,通过sudo docker container ls -a  #来查看


#---- 启动容器，执行容器内命令
sudo docker container run wangjl580/pytest:v01 cat /etc/passwd |grep root
sudo docker container run -it node:8.16.1 cat /etc/os-release # -it 表示交互式执行
sudo docker container run -v /mnt/my_linux/soft_learn/Docker_learn/LearnDocker/mylearn/pytest:/workfolder:ro python:v01  #-v 挂载点:容器中的路径:ro
'''
COPY ./main.py /workfolder/
CMD [ "python", "/workfolder/main.py" ]
'''

#---上传至dockerhub的方法
#1.
sudo docker images #列出镜像 或者sudo docker image ls
#2.
sudo docker login  #登录账号 sudo docker login -u wangjl580 -p 1011320sr 记录账户名和密码, 以后直接sudo docker login 
#3.
sudo docker tag hello-world:latest wangjl580/goodpython:hello-world-test #执行docker tag命令
sudo docker tag node:8.16.1 wangjl580/dynode:node-8.16.1
#4.
sudo docker push wangjl580/dynode:node-8.16.1

#-在别的电脑上，也是需要装上docker的
sudo docker pull wangjl580/dynode:node-8.16.1 #拉取
#或者 sudo docker image pull wangjl580/dynode:node-8.16.1 
sudo docker container run wangjl580/dynode:node-8.16.1  #运行

#---
# 启动容器，确认效果
$ sudo docker container run --name myweb -d -p 8088:80 nginx:1.    17.5-alpine
$ sudo docker container ls
# 服务动作确认
$ curl http://127.0.0.1:8088
# 停止容器服务
$ sudo docker container stop myweb
# 启动存在的容器
$ sudo docker container start myweb
# 列出所有容器
$ sudo docker container ls -a
# 删除指定容器
$ sudo docker container rm -f myweb
# 删除所有容器
$ sudo docker container prune

#---删除镜像文件
docker rmi [OPTIONS] IMAGE [IMAGE...]
-f :强制删除；
docker rmi -f runoob/ubuntu:v4
