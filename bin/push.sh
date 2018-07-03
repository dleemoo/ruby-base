#!/usr/bin/env bash

declare -a all_versions=(2.3.0 2.3.1 2.3.3 2.3.7 2.4.1 2.5.1)

docker push dleemoo/base

for i in "${all_versions[@]}"; do
  docker push dleemoo/ruby-base-${i}
  docker push dleemoo/app-${i}
done
