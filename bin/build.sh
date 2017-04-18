#!/usr/bin/env sh

root_dir=$(pwd)

cd base \
   && docker build --rm -t base . \
   && docker tag $(docker images -q base | head -n1) dleemoo/base:latest \
   && cd $root_dir

cd 2.3.0 \
   && docker build --rm -t rb-230 . \
   && docker tag $(docker images -q rb-230 | head -n1) dleemoo/ruby-base:2.3.0 \
   && cd $root_dir

cd 2.3.1 \
   && docker build --rm -t rb-231 . \
   && docker tag $(docker images -q rb-231 | head -n1) dleemoo/ruby-base:2.3.1 \
   && cd $root_dir

cd 2.3.3 \
   && docker build --rm -t rb-233 . \
   && docker tag $(docker images -q rb-231 | head -n1) dleemoo/ruby-base:2.3.3 \
   && cd $root_dir

cd 2.4.1 \
   && docker build --rm -t rb-241 . \
   && docker tag $(docker images -q rb-241 | head -n1) dleemoo/ruby-base:2.4.1 \
   && cd $root_dir

cd app-2.3.0 \
   && docker build --rm -t app-230 . \
   && docker tag $(docker images -q app-230 | head -n1) dleemoo/app:2.3.0 \
   && cd $root_dir

cd app-2.3.3 \
   && docker build --rm -t app-233 . \
   && docker tag $(docker images -q app-231 | head -n1) dleemoo/app:2.3.3 \
   && cd $root_dir

cd app-2.4.1 \
   && docker build --rm -t app-241 . \
   && docker tag $(docker images -q app-241 | head -n1) dleemoo/app:2.4.1 \
   && cd $root_dir
