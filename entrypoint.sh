#!/usr/bin/env bash

./cli/prepare.php

envsubst < ./data/config.custom.php.template > ./data/config.custom.php

./cli/do-install.php --default_user "$DEFAULTUSER"

./cli/create-user.php --user "$DEFAULTUSER" --password letmein

export DOCUMENTROOT="/p/"

exec /usr/libexec/s2i/run
