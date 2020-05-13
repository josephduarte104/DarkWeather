FROM python:3.6-slim-buster
RUN apt-get update && apt-get install -y --no-install-recommends
COPY . /app
WORKDIR /app
RUN pip3 install numpy
RUN pip3 install -r requirements.txt 
<<<<<<< HEAD
EXPOSE 5000
ENTRYPOINT [ "python" ] 
CMD [ "app.py" ]
=======
EXPOSE 5001
CMD [ "python","app.py" ]
>>>>>>> 806ac3d2fce6d2b8d4433b8ea988508fbb20d192
