# BnetApi

[![Gem Version](https://badge.fury.io/rb/bnet_api.svg)](http://badge.fury.io/rb/bnet_api)
[![Build Status](https://travis-ci.org/tconnolly/BnetApi.svg?branch=master)](https://travis-ci.org/tconnolly/BnetApi)
[![Code Climate](https://codeclimate.com/github/tconnolly/BnetApi/badges/gpa.svg)](https://codeclimate.com/github/tconnolly/BnetApi)
[![Coverage Status](https://coveralls.io/repos/tconnolly/BnetApi/badge.png?branch=master)](https://coveralls.io/r/tconnolly/BnetApi?branch=master
)[![Inline docs](http://inch-ci.org/github/tconnolly/bnetapi.svg?branch=master)](http://inch-ci.org/github/tconnolly/bnetapi)

A Ruby wrapper for the Battle.net API.

## Installation

	gem install bnet_api

## Requirements

* Ruby 2.0.0 or higher

## Configuration

You need to set at least the Battle.net API key in the configuration, either in the code or in an initializer.

You can also change the region of the API to query and the locale of the returned data.

```ruby
BnetApi.config.api_key = 'YOUR_API_KEY'
BnetApi.config.api_secret = 'YOUR_API_SECRET'
```

```ruby
# config/initializers/bnet_api.rb
require 'bnet_api'

BnetApi.configure do |config|
  config.region = :eu
  config.locale = :en_GB

  config.api_key = 'YOUR_API_KEY'
  config.api_secret = 'YOUR_API_SECRET'
end
```

### Regions

* us
* eu
* kr
* tw

### Locales

Region   | Locales  
---------|----------
us       | en_US, es_MX, pt_BR 
eu       | en_GB, es_ES, fr_FR, ru_RU, de_DE, pl_PL, pt_PT, it_IT 
kr       | ko_KR    
tw       | zh_TW

## Usage

Documentation can be found in the [wiki](https://github.com/tconnolly/BnetApi/wiki)