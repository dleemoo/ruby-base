FROM dleemoo/ruby-base:2.3.0

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# Enviroment (bundler, gem, directory paths and PATH)
ENV APP_HOME=/app \
    GEM_HOME=/gems \
    BUNDLE_PATH=/gems \
    BUNDLE_BIN=/gems/bin \
    BUNDLE_APP_CONFIG=/gems \
    PATH=/gems/bin:$PATH

# script to runs container as normal user
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# install gosu and bundler and set directories ownership
RUN wget -qO /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 \
    && mkdir -p $APP_HOME $BUNDLE_BIN \
    && chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/gosu \
    && gem update --system 1>/dev/null

WORKDIR $APP_HOME

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
