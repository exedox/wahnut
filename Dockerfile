FROM ubuntu:16.04

RUN apt-get update && \
        apt-get install -y software-properties-common vim && \
        add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update -y

RUN apt-get install -y build-essential git curl python3.6 python3.6-dev python3-pip python3.6-venv && \
        apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel

RUN pip3 install colorama pyopenssl requests tqdm unidecode image bs4 urllib3 flask pyqt5


RUN git clone https://github.com/blawar/nut /nut

COPY nut.conf /nut/conf/nut.conf

COPY users.conf /nut/conf/users.conf

COPY start.sh /start.sh

ENTRYPOINT ["/bin/bash", "start.sh"]
