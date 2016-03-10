FROM debian:sid
MAINTAINER KURASHIKI Satoru <lurdan@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y atig

EXPOSE 16668

ENTRYPOINT [ "atig", "-d", "-h" ]
CMD ["localhost"]

