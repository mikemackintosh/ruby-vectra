# Ruby Vectra
A Ruby extension for interfacing with Vectra API.

[![TravisCI](https://travis-ci.org/mikemackintosh/ruby-vectra.svg)](https://travis-ci.org/mikemackintosh/ruby-vectra)

# Installation

Like any other gem:

```shell
gem install vectra
```
# Usage

Basic Block Configuration:

    Vectra.configure do |config|
      config.endpoint = @endpoint_url # https://vectra/api/
      config.username = @username
      config.password = @password
    end

## Detections

    Vectra::Detections.all

or by ID

    Vectra::Detections.get(1)

    
## Hosts

    Vectra::Hosts.all

or by ID

    Vectra::Hosts.get(1)


# Features

  - Supports Hosts and Detections