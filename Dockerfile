FROM ubuntu:16.04
RUN git clone https://github.com/exedox/wahnut /scripts
COPY sync.sh /scripts
CMD /scripts/sync.sh
