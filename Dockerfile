FROM ubuntu:16.04

RUN apt-get update && \
        apt-get install -y software-properties-common vim && \
        add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update -y
RUN apt-get install python3.6 -y

RUN apt-get install -y build-essential git curl python3.6 python3.6-dev python3-pip python3.6-venv && \
        apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel

RUN pip3 install colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask pyusb pyqt5 google-api-python-client google-auth-oauthlib

RUN git clone https://github.com/blawar/nut.git /nut

COPY nut.conf /nut/conf/nut.conf

COPY users.conf /nut/conf/users.conf

COPY start.sh /start.sh

ENTRYPOINT ["/bin/bash", "start.sh"]
