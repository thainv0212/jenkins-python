FROM ubuntu:xenial-20210114
# install python3.6
RUN apt-get update && \
    apt-get install software-properties-common build-essential wget -y && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get install python3.6 python3.6-dev python3.6-venv -y && \ 
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN rm -rf /usr/local/bin/pip3
RUN ln -s /usr/local/bin/pip3.6 /usr/local/bin/pip3
RUN rm -rf /usr/bin/python3
RUN ln -s /usr/bin/python3.6 /usr/bin/python3

COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt

CMD ["python3.6", "app.py"]