FROM openjdk:8-jre

WORKDIR /

#ENV GITHUB_TAG=v2.0.4-draft1
#ENV VERSION=2.0.4

ENV GITHUB_TAG=v1.4.0.1

ENV GATEWAY_HOST=TB-HOST
ENV GATEWAY_ACCESS_TOKEN=TB-GATEWAY-TOKEN

COPY run.sh /run.sh

# v2.0.4-draft1
#RUN wget https://github.com/thingsboard/thingsboard-gateway/releases/download/$GITHUB_TAG/tb-gateway.deb -O tb-gateway.deb
#v1.4.0.1
RUN wget https://github.com/thingsboard/thingsboard-gateway/releases/download/$GITHUB_TAG/tb-gateway-1.4.0.deb -O tb-gateway.deb
RUN dpkg -i tb-gateway.deb && chmod +x /run.sh

RUN rm /tb-gateway.deb

VOLUME [ "/usr/share/tb-gateway/conf" ]

CMD /run.sh
