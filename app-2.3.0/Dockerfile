FROM dleemoo/ruby-base-2.3.0:0.0.2

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# Enviroment (bundler, gem, directory paths and PATH)
ENV APP_HOME=/app \
    GEM_HOME=/gems \
    BUNDLE_PATH=/gems \
    BUNDLE_BIN=/gems/bin \
    BUNDLE_APP_CONFIG=/gems \
    PATH=/gems/bin:$PATH

# script to runs container as normal user
COPY entrypoint.sh /usr/share/docker/entrypoint.sh

# setup basic environment to run as normal user and use /gems/bin
RUN set -ex \
    && mkdir -p $APP_HOME $BUNDLE_BIN \
    && curl -sL https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 -o /usr/local/bin/gosu \
    && sed -i s@'PATH="\(.*\)"'@'PATH="/gems/bin:\1"'@g /etc/profile \
    && chmod +x /usr/share/docker/entrypoint.sh /usr/local/bin/gosu \
    && gem update --system 1>/dev/null

WORKDIR $APP_HOME

ENTRYPOINT ["/usr/share/docker/entrypoint.sh"]
