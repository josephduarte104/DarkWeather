FROM python:3.6-slim-buster
RUN apt-get update && apt-get install -y --no-install-recommends
COPY . /app
WORKDIR /app
RUN pip3 install numpy
RUN pip3 install -r requirements.txt 
EXPOSE 5000
ENTRYPOINT [ "python3" ] 
CMD [ "app.py" ]