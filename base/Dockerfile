FROM alpine:3.4

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# upgrade alpine and install Ruby
RUN set -ex \
  # sync alpine
  && apk update \
  && apk upgrade \
  # Ruby dependencies for runtime and build (language and common gem extensions)
  && apk add autoconf bison bzip2-dev build-base ca-certificates coreutils \
         gdbm-dev glib-dev libffi-dev openssl openssl-dev libxml2-dev \
         libxslt-dev linux-headers ncurses-dev postgresql-dev procps tar \
         xz readline-dev yaml-dev zlib-dev \
  # remove apk cache
  && rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
