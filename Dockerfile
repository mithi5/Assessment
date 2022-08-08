FROM alpine
MAINTAINER Mithilesh
RUN apt-get update && apt-get upgrade -y
RUN apk add --update redis
EXPOSE 6379
CMD ["redis-server"]
