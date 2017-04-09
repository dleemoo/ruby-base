# ruby-base

Base docker images for Ruby applications running as normal user.

## Example

TODO

## Ruby 2.4.1

The `dleemoo/app:2.4.1` image (in the directory `app-2.4.1`) provides an
environment with support for common `gems` that require native extensions and
use `Ruby 2.4.1`. It is built on top of base `Ruby` image
`dleemoo/ruby-base:2.4.1` (in the directory `2.4.1`) and commes with support
for:

1. `gem` at version `2.6.11`
2. `bundle` at version `1.14.6`
3. User with `app` username and without `root` access
4. Default application directory at `/app`
5. Support for `pg` and `nokogiri` installation


## Ruby 2.3.1

The `dleemoo/app:2.3.1` image (in the directory `app-2.3.1`) provides an
environment with support for common `gems` that require native extensions and
use `Ruby 2.3.1`. It is built on top of base `Ruby` image
`dleemoo/ruby-base:2.3.1` (in the directory `2.3.1`).

1. `gem` at version `2.5.1`
2. `bundle` at version `1.14.6`
3. User with `app` username and without `root` access
4. Default application directory at `/app`
5. Support for `pg` and `nokogiri` installation

## Ruby 2.3.0

The `dleemoo/app:2.3.0` image (in the directory `app-2.3.0`) provides an
environment with support for common `gems` that require native extensions and
use `Ruby 2.3.0`. It is built on top of base `Ruby` image
`dleemoo/ruby-base:2.3.0` (in the directory `2.3.0`).

1. `gem` at version `2.5.1`
2. `bundle` at version `1.14.6`
3. User with `app` username and without `root` access
4. Default application directory at `/app`
5. Support for `pg` and `nokogiri` installation

## base

All images are built on top of the `dleemoo/base` (in the `base` directory)
which is in turn based on the `dleemoo/base` image (on top of `alpine:3.4`).

# TODO

1. Reduce image size while supporting native extensions
2. Make `Dockerfile` files simpler and more extensible
