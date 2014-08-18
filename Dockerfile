FROM google/debian:wheezy

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget

RUN wget  --no-check-certificate -O /tmp/go.tar.gz https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /tmp/go.tar.gz
RUN mkdir /opt/go

ENV GOROOT /usr/local/go
ENV GOPATH = /opt/go

ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

RUN mkdir /opt/detroitfrontend/
ADD DetroitInfoFrontEnd /opt/detroitfrontend/

EXPOSE 7774
ENTRYPOINT ["/opt/detroitfrontend/DetroitInfoFrontEnd"]


