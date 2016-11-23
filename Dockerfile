FROM python:3.5
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y mysql-client
RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/
