FROM debian:jessie-slim

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

ENV LANG=C.UTF-8

ONBUILD ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex \
  # do not generate debian documentation files
  && echo 'path-exclude /usr/share/doc/*'            > /etc/dpkg/dpkg.cfg.d/01_nodoc \
  && echo 'path-include /usr/share/doc/*/copyright' >> /etc/dpkg/dpkg.cfg.d/01_nodoc \
  && echo 'path-exclude /usr/share/groff/*'         >> /etc/dpkg/dpkg.cfg.d/01_nodoc \
  && echo 'path-exclude /usr/share/info/*'          >> /etc/dpkg/dpkg.cfg.d/01_nodoc \
  && echo 'path-exclude /usr/share/lintian/*'       >> /etc/dpkg/dpkg.cfg.d/01_nodoc \
  && echo 'path-exclude /usr/share/linda/*'         >> /etc/dpkg/dpkg.cfg.d/01_nodoc \
  && mkdir -p /usr/share/man/man1 /usr/share/man/man7 \
  # update debian and install dependencies
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y apt-transport-https autoconf bison build-essential \
    curl libffi-dev libgdbm3 libgdbm-dev libncurses5-dev libreadline6-dev \
    libssl-dev libyaml-dev xz-utils zlib1g-dev 1>/dev/null \
  # remove apt files
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD ["/bin/sh"]
