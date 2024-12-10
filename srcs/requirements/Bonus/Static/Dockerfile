FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nodejs npm

WORKDIR /usr/src/app

COPY Tools .

EXPOSE 3000

ENTRYPOINT ["node", "server.js"]
