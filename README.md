# ruby-base

Base docker images for Ruby applications running as normal user.

## Ruby repositories

Base images for use with docker available at https://hub.docker.com/u/dleemoo
for the following versions of Ruby:

1. 2.4.1
2. 2.3.3
3. 2.3.1
4. 2.3.0

The `dleemoo/ruby-base-X.Y.Z` repository contains images for version 2.4.1 and
is available in the `rb-X.Y.Z` directory. The same goes for the other supported
versions.

All Ruby repositories are based on the `dleemoo/base` repository which in turn
is built on the debian `image:jessie-slim`.

## App repositories

For each supported Ruby version there is a corresponding application repository
(using the `dleemoo/app-X.Y.Z` naming) that is available in the `app-X.Y.Z`
directory.

These images provide the latest version of RubyGems (using the / `gems`
directory as `$GEM_HOME` and `$BUNDLE_PATH`).

The `gosu` command is used in conjunction with the image `entrypoint` to ensure
that only the `app` user will be used when executing a container with this
image.

An image from these base images is expected to install the appropriate version
of the `bundler` and in this image only the environment variables and the
`$PATH` is configured for future use with the `bundler`.

All `app` images are prepared for installation of more common `gems` with native
extensions such as `pg` and `nokogiri`.

## Example

The purpose of these images is to allow a container with a Ruby app to be
manipulated easily with a Dockerfile in this way:

```
FROM dleemoo/app-2.4.1:0.0.1

ENV BUNDLER_VERSION=1.13.7

RUN set -ex \
  # sync debian and install app dependencies
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install git nodejs -y \
  # setup postgres client libs and headers
  && apt-get install postgresql-client -y \
  # install bundler
  && gem install bundler -v $BUNDLER_VERSION \
  # remove apt cache
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Other image requirements ...
```

For debug purpose that need root access we can use following command:

```
docker run --rm -it --entrypoint=/bin/bash image_name
```
