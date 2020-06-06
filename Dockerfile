FROM python:3.6-slim-buster
RUN apt-get update && apt-get install -y --no-install-recommendsRUN apt-get -y install python3-dev
RUN apt-get -y install python3-dev
COPY . /app
WORKDIR /app
RUN pip install flask_monitoringdashboard
RUN pip3 install numpy
RUN pip3 install -r requirements.txt 
EXPOSE 5001
CMD [ "python","app.py" ]
