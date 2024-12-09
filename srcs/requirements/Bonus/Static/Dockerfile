FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nodejs npm

COPY WebPage /WebPage
RUN chmod 777 /WebPage

EXPOSE 3000

WORKDIR /WebPage

RUN npm install express

ENTRYPOINT ["node", "WebPage.js"]
