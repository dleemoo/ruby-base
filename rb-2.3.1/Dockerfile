FROM dleemoo/base:0.0.4

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# environment variables for Ruby build
ENV RUBY_MAJOR=2.3 \
    RUBY_VERSION=2.3.1 \
    RUBY_DOWNLOAD_SHA256=b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd

RUN set -ex \
  # update debian and install dependencies
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
  # downgrade openssl for ruby < 2.4
  # https://github.com/rbenv/ruby-build/wiki#openssl-usrincludeopensslasn1_mach102-error-error-this-file-is-obsolete-please-update-your-software
  && DEBIAN_FRONTEND=noninteractive apt-get install -y libssl1.0-dev \
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
