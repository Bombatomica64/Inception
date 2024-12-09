FROM debian:11

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y npm nodejs
COPY /WebPage /var/www/html/WebPage

CMD [ "echo", "WebPage is running" ]
