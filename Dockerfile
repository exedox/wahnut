FROM ubuntu:16.04
RUN git clone --depth=1 https://github.com/exedox/wahnut /scripts
COPY sync.sh /scripts
CMD /scripts/sync.sh
