FROM dleemoo/base:0.0.3

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# environment variables for Ruby build
ENV RUBY_MAJOR=2.5 \
    RUBY_VERSION=2.5.1 \
    RUBY_DOWNLOAD_SHA256=886ac5eed41e3b5fc699be837b0087a6a5a3d10f464087560d2d21b3e71b754d

RUN set -ex \
  # update debian and install dependencies
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
  # download, compile and install Ruby
  && curl -sL "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" -o /tmp/ruby.tar.xz \
  && echo "$RUBY_DOWNLOAD_SHA256 /tmp/ruby.tar.xz" | sha256sum -c - \
  && mkdir -p /tmp/ruby \
  && tar xf /tmp/ruby.tar.xz -C /tmp/ruby --strip-components=1 \
  && cd /tmp/ruby \
  && autoconf 1>/dev/null \
  && ac_cv_func_isnan=yes ac_cv_func_isinf=yes ./configure --disable-install-doc --enable-shared 1>/dev/null \
  && make -j"$(getconf _NPROCESSORS_ONLN)" 1>/dev/null \
  && make install 1>/dev/null \
  && cd / \
  # do not generate gem docs by default
  && mkdir -p /usr/local/etc && { \
      echo 'install: --no-document'; \
      echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc \
  # remove apt cache and temporary files
  && rm -rf /tmp/ruby* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD ["irb"]
