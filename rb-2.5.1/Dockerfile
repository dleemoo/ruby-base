FROM dleemoo/base:0.0.4

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# environment variables for Ruby build
ENV RUBY_MAJOR=2.5 \
    RUBY_VERSION=2.5.1 \
    RUBY_DOWNLOAD_SHA256=dac81822325b79c3ba9532b048c2123357d3310b2b40024202f360251d9829b1

RUN set -ex \
  # update debian and install dependencies
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
  # download, compile and install Ruby
  && curl -sL "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.gz" -o /tmp/ruby.tar.gz \
  && echo "$RUBY_DOWNLOAD_SHA256 /tmp/ruby.tar.gz" | sha256sum -c - \
  && mkdir -p /tmp/ruby \
  && tar xf /tmp/ruby.tar.gz -C /tmp/ruby --strip-components=1 \
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
