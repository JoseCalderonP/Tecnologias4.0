FROM debian

ARG DOCUMENTROOT=/srv/
ARG SERVER_NAME=_

ENV DOCUMENTROOT=$DOCUMENTROOT
ENV SERVER_NAME=$SERVER_NAME

COPY estilos/ $DOCUMENTROOT/estilos
COPY img/ $DOCUMENTROOT/img
COPY index.html $DOCUMENTROOT/index.html
COPY init.sh /init.sh

RUN apt-get update && apt-get install -y nginx && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN chmod 700 /init.sh

EXPOSE 80

CMD ["/init.sh"]
