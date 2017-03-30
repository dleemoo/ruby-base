FROM ruby:2.4.1-alpine

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

# extra packages to be installed
ENV PACKAGES bash curl ruby-dev build-base

# bundler configuration
ENV APP_HOME=/app \
    USER_HOME=/home/app \
    BUNDLE_PATH=/gems \
    BUNDLE_JOBS=4

# script that setup user and directory permissions
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Update and install required packages
RUN apk update && \
    apk upgrade && \
    apk add $PACKAGES && \
    # remove the apk cache
    rm -rf /var/cache/apk/* && \
    # install gosu and set directories ownership
    curl -so /usr/local/bin/gosu -SL https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 && \
    mkdir -p $BUNDLE_PATH $USER_HOME $APP_HOME && \
    chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/gosu

WORKDIR $APP_HOME

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
