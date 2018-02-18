FROM alpine:3.6

LABEL Maintainer=Ravi<ravismail@gmail.com>

## set the proxy server configuration default to $HTTP_PROXY
#ARG HTTP_PROXY=http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80
#ENV http_proxy=$HTTP_PROXY \
#    https_proxy=$HTTP_PROXY
#
#WORKDIR /app
#
## install ca-certificates and get load internal ca certificate
#RUN apk update && apk add --update ca-certificates curl openssh \
#    wget -O GE_External_Root_CA_2_1.crt http://static.gecirtnotification.com/browser_remediation/packages/GE_External_Root_CA_2_1.crt \
#    cp GE_External_Root_CA_2_1.crt /etc/ssl/certs/
#
#RUN update-ca-certificates


RUN apk add --update mosquitto mosquitto-clients

#MQTT port
EXPOSE 1883

ENV PATH /usr/sbin:$PATH

ENTRYPOINT ["/usr/sbin/mosquitto"]