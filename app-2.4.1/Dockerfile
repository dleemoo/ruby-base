FROM dleemoo/ruby-base:2.4.1

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# Enviroment (bundler, gem, directory paths and PATH)
# gem --version: 2.6.11 (from ruby-base:2.4.1)
ENV BUNDLER_VERSION=1.14.6 \
    APP_HOME=/app \
    USER_HOME=/home/app \
    GEM_HOME=/gems \
    BUNDLE_PATH=/gems \
    BUNDLE_BIN=/gems/bin \
    BUNDLE_APP_CONFIG=/gems \
    PATH=/gems/bin:$PATH

# script to runs container as normal user
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# install gosu and bundler and set directories ownership
RUN wget -O /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 \
    && mkdir -p $USER_HOME $APP_HOME $GEM_BIN \
    && chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/gosu \
    && gem install bundler --version "$BUNDLER_VERSION"

WORKDIR $APP_HOME

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
