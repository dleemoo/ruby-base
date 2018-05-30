FROM debian:stretch-slim

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

ENV LANG=C.UTF-8

RUN set -ex \
  # update debian and install dependencies
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https autoconf bison build-essential \
    curl libffi-dev libgdbm3 libgdbm-dev libncurses5-dev libreadline6-dev \
    libssl-dev libyaml-dev zlib1g-dev 1>/dev/null \
  # remove apt files
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD ["/bin/sh"]
