FROM dleemoo/base:3.4

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# environment variables for rubygems, bundler and Ruby
ENV RUBY_MAJOR=2.3 \
    RUBY_VERSION=2.3.1 \
    RUBY_DOWNLOAD_SHA256=6725b5534d5a3a21ec4f14d6d7b9921a0d00d08acb88fd04cd50b47b70496338

# upgrade alpine and install Ruby
RUN set -ex \
  # download, compile and install Ruby
  && echo "downloading: https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" \
  && wget -O /tmp/ruby.tar.xz "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" \
  && echo "$RUBY_DOWNLOAD_SHA256 /tmp/ruby.tar.xz" | sha256sum -c - \
  && mkdir -p /tmp/ruby \
  && tar -xJf /tmp/ruby.tar.xz -C /tmp/ruby --strip-components=1 \
  && cd /tmp/ruby \
  && autoconf \
  && ac_cv_func_isnan=yes ac_cv_func_isinf=yes ./configure --disable-install-doc --enable-shared \
  && make -j"$(getconf _NPROCESSORS_ONLN)" \
  && make install \
  && cd / \
  # rmove temporary files
  && rm -rf /tmp/ruby /tmp/ruby.tar.gz \
  # do not generate gem docs by default
  && mkdir -p /usr/local/etc && { \
      echo 'install: --no-document'; \
      echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc

CMD ["irb"]
