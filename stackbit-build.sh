#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e1747e67e184700194abebd/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e1747e67e184700194abebd
curl -s -X POST https://api.stackbit.com/project/5e1747e67e184700194abebd/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e1747e67e184700194abebd/webhook/build/publish > /dev/null
