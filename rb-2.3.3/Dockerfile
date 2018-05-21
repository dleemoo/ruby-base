FROM dleemoo/base:0.0.2

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# environment variables for Ruby build
ENV RUBY_MAJOR=2.3 \
    RUBY_VERSION=2.3.3 \
    RUBY_DOWNLOAD_SHA256=1a4fa8c2885734ba37b97ffdb4a19b8fba0e8982606db02d936e65bac07419dc

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
