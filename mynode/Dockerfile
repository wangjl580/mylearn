#FROM python:3.8
FROM python:3.8.0-alpine3.10

#RUN pip3 install numpy
RUN mkdir -p /workfolder
COPY ./main.py /workfolder/

CMD [ "python", "/workfolder/main.py" ]
