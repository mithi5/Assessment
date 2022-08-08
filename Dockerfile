FROM alpine
MAINTAINER Mithilesh
RUN apk add --update redis
EXPOSE 6379
CMD ["redis-server"]
LABEL mithiliesh
