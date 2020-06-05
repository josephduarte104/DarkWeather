FROM python:3.6-slim-buster
RUN apt-get update && apt-get install -y --no-install-recommends
COPY . /app
WORKDIR /app
RUN pip3 install numpy
RUN pip3 install flask_monitoringdashboard
RUN pip3 install -r requirements.txt 
EXPOSE 5001
CMD [ "python","app.py" ]
