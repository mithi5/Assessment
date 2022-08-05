FROM ubuntu:latest
MAINTAINER Mithilesh
RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y
CMD ["nginx", "-g", "daemon off;"]
RUN apt-get update
