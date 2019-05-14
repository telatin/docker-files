FROM ubuntu:16.04
LABEL last.tested="2019.05"

# Installing all dependancies
RUN apt-get update && apt-get install -y \
     wget git nano sudo build-essential bzip2  unzip curl \
     libncurses5-dev libncursesw5-dev zlib1g-dev  \
     bioperl libgd-gd2-perl libxml-libxml-perl  cpanminus libdist-zilla-perl
RUN mkdir /home/tradis
WORKDIR /home/tradis
