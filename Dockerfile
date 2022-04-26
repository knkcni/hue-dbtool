FROM gethue/hue:20220505-140101

USER root

WORKDIR /usr/share/hue

RUN apt-get update && apt-get install \
    vim xmlsec1 libxmlsec1-openssl git gcc python-dev swig openssl -y \
  && rm -rf /var/lib/apt/lists/*

# USER hue

RUN ./build/env/bin/pip install mysqlclient pysaml2 djangosaml2

EXPOSE 8888

CMD ["./startup.sh"]