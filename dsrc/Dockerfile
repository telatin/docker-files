FROM alpine:3.7
RUN mkdir /tools && cd /tools && wget "http://sun.aei.polsl.pl/REFRESH/dsrc/downloads/2.0rc2/linux/dsrc" && chmod +x dsrc
ENV PATH="/tools/:${PATH}"

