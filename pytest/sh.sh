#方法一：
#sudo docker pull python #拉取python镜像，在dockerhub 服务器中
sudo docker container run -v /mnt/my_linux/soft_learn/Docker_learn/LearnDocker/mylearn/pytest:/workfolder:ro python:latest python /workfolder/main.py  #可以通过容器中的python运行本地py文件
#方法二
#编辑Dockerfile 文件如下内容
<<!
FROM python:latest
RUN pip install PyAutoGUI
COPY ./main.py ./main.py
CMD [ "python", "./main.py" ]
!
#sudo docker build -t mypython_autogui:latest . #直接将main.py编译到镜像中mypython_autogui:latest
#sudo docker container run -it mypython_autogui:latest #然后运行

