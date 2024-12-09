FROM debian:11

RUN apt-get update -y && apt-get upgrade -y

COPY WebPage /WebPage
COPY Tools/setup.sh /
RUN chmod 777 /setup.sh

ENTRYPOINT [ "/setup.sh" ]
CMD [ "ls" , "/var/www/html/WebPage" ]
