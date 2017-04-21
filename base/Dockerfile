FROM buildpack-deps:jessie

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

RUN set -ex \
  # sync debian
  && apt-get update -qq \
  && apt-get upgrade -y \
  && apt-get install apt-transport-https -y \
  # remove apt cache
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD ["/bin/sh"]
