#!/usr/bin/env bash

root_dir=$(pwd)

declare -a all_versions=(2.3.0 2.3.1 2.3.3 2.4.1)

if [ -z "$1" ]; then
  declare -a list=(${all_versions[@]})
else
  declare -a list=()
  for i in $@; do
    [[ "${all_versions[@]}" =~ "$i" ]] && list=(${list[@]} $i)
  done
fi

function build() {
  image=$1
  repo=$2

  cd $image \
     && docker build --rm -t $image . \
     && docker tag $(docker images -q $image | head -n1) $repo \
     && cd $root_dir
}

function fbuild() {
  image=$1
  repo=$2

  cd $image \
     && docker build --no-cache --rm -t $image . \
     && docker tag $(docker images -q $image | head -n1) $repo \
     && cd $root_dir
}

if [ ${#list[@]} -gt 0 ]; then
  build base "dleemoo/base:latest" &&
  for i in "${list[@]}"; do
    build "rb-${i}" "dleemoo/ruby-base:${i}" && {
      if [ "$FORCE_APP_BUILD" == "true" ]; then
        fbuild "app-${i}" "dleemoo/app:${i}"
      else
        build "app-${i}" "dleemoo/app:${i}"
      fi
    }
  done
fi
