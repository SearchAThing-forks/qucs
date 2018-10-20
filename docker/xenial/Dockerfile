FROM searchathing/ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y automake autoconf libtool autogen pkg-config
RUN apt-get install -y libqt4-dev
RUN apt-get install -y gperf flex bison
RUN apt-get install -y libxml-libxml-perl

CMD /bin/bash
