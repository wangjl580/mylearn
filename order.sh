sudo docker container run --rm -it \
    -v /home/wjl/mydocker/mydocker:/workfolder:ro \
    python:3.8.0-alpine3.10 \
    python /workfolder/main.py
