route-registrar
===============

[![Build Status](https://travis-ci.org/cloudfoundry-incubator/route-registrar.svg?branch=master)](https://travis-ci.org/cloudfoundry-incubator/route-registrar)

A standalone executable written in golang that continuously broadcasts a route using NATS to the CF router.

This uses [yagnats](https://github.com/cloudfoundry/yagnats) for connecting to the NATS bus and [gibson](https://github.com/cloudfoundry/gibson) for registering routes with the CloudFoundry router.

## Usage

### BOSH release

You can colocate `route-registrar` into any BOSH deployment using https://github.com/cloudfoundry-community/route-registrar-boshrelease BOSH release.

### Executing tests

To run tests, run `bin/test` from the root of this repository.
