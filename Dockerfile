FROM nvidia/cuda:11.4.0-cudnn8-devel-ubuntu20.04

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY requirements.txt .

RUN apt-get update && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /app/.

RUN nvcc /app/hello_world.cu -o /app/a.out
CMD exec /app/a.out