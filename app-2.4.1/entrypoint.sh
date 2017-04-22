#!/usr/bin/env sh

USER_ID=${USER_ID:-1000}
GROUP_ID=${GROUP_ID:-100}

useradd --uid $USER_ID --gid $GROUP_ID -d /home/app app 2>/dev/null
chown -R app. $APP_HOME $BUNDLE_PATH

if [ -z "$*" ]; then
  exec gosu app bash
else
  exec gosu app $*
fi
