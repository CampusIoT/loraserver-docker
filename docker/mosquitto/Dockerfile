FROM ubuntu:16.04

MAINTAINER CampusIoT

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.docker.dockerfile="/Dockerfile" \
    org.label-schema.license="EPLv2" \
    org.label-schema.url="https://hub.docker.com/r/campusiot/mosquitto/" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/campusiot"

RUN apt-get update && apt-get install -y mosquitto mosquitto-clients

RUN mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log /etc/mosquitto/certs
RUN mv /etc/mosquitto/mosquitto.conf /mosquitto/config

# COPY certs/ /etc/mosquitto/certs
# COPY config/ /mosquitto/config

RUN chown -R mosquitto:mosquitto /mosquitto
RUN chown -R mosquitto:mosquitto /etc/mosquitto/certs
VOLUME ["/mosquitto/config", "/mosquitto/data", "/mosquitto/log", "/etc/mosquitto/certs"]

EXPOSE 1883 8883 9001 9883

ADD docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
