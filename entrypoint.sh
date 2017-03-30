#!/bin/bash

USER_ID=${USER_ID:-1000}
GROUP_ID=${GROUP_ID:-100}

addgroup -g $GROUP_ID users 2>/dev/null
adduser -u $USER_ID -D -G users app
chown -R app. $APP_HOME $BUNDLE_PATH $USER_HOME

exec /usr/local/bin/gosu app "$@"
