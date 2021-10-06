我在ubutnu虚拟机中装了docker,mac 中没有
#想学习的话在ubuntu虚拟机中学习


#---学习记录
sudo docker image pull node:8.16.1  #获取node镜像
sudo docker image ls #查看已安装的镜像
#建立一个Node.js的运行环境(container/容器)
<<!
FROM python:3.8
RUN pip3 install numpy
RUN mkdir -p /workfolder
COPY ./main.py /workfolder/
CMD [ "python", "/workfolder/main.py" ]
!
sudo docker image build -t komavideo/mynode:v01 . #编译打包我们的运行环境,t表示标签, #相当于类的实例化
sudo docker container run komavideo/mynode:v01 # 在环境中运行我们的应用




