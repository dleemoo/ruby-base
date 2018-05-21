#!/usr/bin/env bash

root_dir=$(pwd)

declare -a all_versions=(2.3.0 2.3.1 2.3.3 2.4.1 2.5.1)

if [ -z "$1" ]; then
  declare -a list=(${all_versions[@]})
else
  declare -a list=()
  for i in $@; do
    [[ "${all_versions[@]}" =~ "$i" ]] && list=(${list[@]} $i)
  done
fi

function build() {
  dir=$1
  repo=$2

  cd $dir \
     && docker build --rm -t $repo:latest . \
     && docker tag $repo:latest $repo:$(cat VERSION) \
     && cd $root_dir
}

build base "dleemoo/base" &&
if [ ${#list[@]} -gt 0 ]; then
  for i in "${list[@]}"; do
    build "rb-${i}" "dleemoo/ruby-base-${i}" &&
    build "app-${i}" "dleemoo/app-${i}"
  done
fi
