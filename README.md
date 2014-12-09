# BnetApi

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [BnetApi](#bnetapi)
  - [Current Version: 0.1.2](#current-version-012)
    - [Status](#status)
  - [Installation](#installation)
  - [Configuration](#configuration)
    - [Regions](#regions)
    - [Locales](#locales)
  - [Examples](#examples)
    - [Achievement API](#achievement-api)
    - [Auction Data API](#auction-data-api)
      - [Sample Request](#sample-request)
      - [Sample Response](#sample-response)
    - [Battlepet API](#battlepet-api)
      - [Battlepet Abilities](#battlepet-abilities)
      - [Battlepet Species](#battlepet-species)
      - [Battlepet Stats](#battlepet-stats)
    - [Challenge Mode API](#challenge-mode-api)
      - [Realm](#realm)
      - [Region](#region)
    - [Character Profile API](#character-profile-api)
    - [Guild API](#guild-api)
    - [Item API](#item-api)
    - [PvP API](#pvp-api)
    - [Quest API](#quest-api)
    - [Realm Status API](#realm-status-api)
    - [Recipe API](#recipe-api)
    - [Spell API](#spell-api)
    - [OAuth APIs](#oauth-apis)
      - [Account ID](#account-id)
      - [Battletag](#battletag)
      - [Starcraft II Profile](#starcraft-ii-profile)
      - [World of Warcraft Profile](#world-of-warcraft-profile)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

[![Gem Version](https://badge.fury.io/rb/bnet_api.svg)](http://badge.fury.io/rb/bnet_api)
[![Build Status](https://travis-ci.org/tconnolly/BnetApi.svg?branch=master)](https://travis-ci.org/tconnolly/BnetApi)
[![Code Climate](https://codeclimate.com/github/tconnolly/BnetApi/badges/gpa.svg)](https://codeclimate.com/github/tconnolly/BnetApi)
[![Coverage Status](https://coveralls.io/repos/tconnolly/BnetApi/badge.png?branch=master)](https://coveralls.io/r/tconnolly/BnetApi?branch=master
)[![Inline docs](http://inch-ci.org/github/tconnolly/bnetapi.svg?branch=master)](http://inch-ci.org/github/tconnolly/bnetapi)

A Ruby wrapper for the Battle.net API

## Current Version: 0.1.2

### Status

        API       | Status
------------------|-----------------
World of Warcraft | Implemented
Diablo III        | Not implemented
Starcraft II      | Not implemented
OAuth			  | Implemented

## Installation

	gem install bnet_api

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


## Examples

Each API method returns a hash containing the values returned from the API.

For more detailed documentation on returned data visit the official documentation (https://dev.battle.net).

### Achievement API

To get the data for an achievement:

```ruby
BnetApi::WoW.achievement(2144)
```

### Auction Data API

The Auction Data API returns the URL of a JSON file containing an auction data dump generated at the time of the `lastModified` return value.

#### Sample Request

```ruby
BnetApi::WoW.auction_data('REALM')
```

#### Sample Response

```json
	{
		"files": [
			{
				"url": "http://eu.battle.net/auction-data/7181c5e54bd6d781d46bdadec17e3637/auctions.json",
				"lastModified": 1418050857000
			}
		]
	}
```

### Battlepet API

#### Battlepet Abilities

To get a battlepet ability from the API:

```ruby
BnetApi::WoW.battlepet_ability(640)
```

#### Battlepet Species

To get a battlepet species from the API:

```ruby
BnetApi::WoW.battlepet_species(258)
```

#### Battlepet Stats

To get the default stats for a battlepet:

```ruby
  BnetApi::WoW.battlepet_stats(258)
```

The Battlepet Stats API also has three optional parameters:

* level
* breedId
* qualityId

Any or all of these can be passed in as named parameters after the species ID:

```ruby
BnetApi::WoW.battlepet_stats(258, level: 25, breedId: 5, qualityId: 4)
```

### Challenge Mode API

#### Realm

To get the challenge mode leaderboard for a realm:

```ruby
BnetApi::WoW.challenge_mode_realm('REALM')
```

#### Region

To get the challenge mode leaderboard for the region:

```ruby
BnetApi::WoW.challenge_mode_region
```

### Character Profile API

To get the basic data for a character:

```ruby
BnetApi::WoW.character('REALM', 'CHARACTER_NAME')
```

To get any additional data fields, pass them in as extra symbol values:

```ruby
BnetApi::WoW.character('REALM', 'CHARACTER_NAME', :achievements, :quests)
```

To get all additional data fields, pass in :all as the extra parameter:

```ruby
BnetApi::WoW.character('REALM', 'CHARACTER_NAME', :all)
```

Available optional fields:

* achievements
* appearance
* feed
* guild
* items
* mounts
* pets
* petSlots
* progression
* pvp
* quests
* reputation
* stats
* talents
* titles
* audit

### Guild API

To get the basic data for a guild:

```ruby
BnetApi::WoW.guild('REALM', 'GUILD_NAME')
```

To get any additional data fields, pass them in as extra symbol values:

```ruby
BnetApi::WoW.guild('REALM', 'GUILD_NAME', :news, :achievements)
```

To get all additional data fields, pass in :all as the extra parameter:

```ruby
BnetApi::WoW.guild('REALM', 'GUILD_NAME', :all)
```

Available optional fields:

* members
* achievements
* news
* challenge

### Item API

To get the data for an item:

```ruby
BnetApi::WoW.item(18803)
```

To get the data for an item set:

```ruby
BnetApi::WoW.item_set(1060)
```

### PvP API

To get the PvP leaderboard for a bracket:

```ruby
BnetApi::WoW.pvp('2v2')
```

Available brackets:

* 2v2
* 3v3
* 5v5
* rbg

### Quest API

To get the data for a quest:

```ruby
BnetApi::WoW.quest(13146)
```

### Realm Status API

To get the status of all realms in the region:

```ruby
BnetApi::WoW.realm_status
```

### Recipe API

To get the data for a recipe:

```ruby
BnetApi::WoW.recipe(33994)
```

### Spell API

To get the data for a spell:

```ruby
BnetApi::WoW.spell(8056)
```

### OAuth APIs

This library isn't concerned with the OAuth authentication, just retrieving data from the API.

You can use the [OmniAuth Bnet](https://github.com/Blizzard/omniauth-bnet) or any other OAuth library to authenticate against the Battle.net OAuth service, and then just pass the user's OAuth Access Token to the OAuth API methods.

#### Account ID

To get the user's account ID:

```ruby
BnetApi::OAuth.account_id('ACCESS_TOKEN')
```

#### Battletag

To get the user's battletag:

```ruby
BnetApi::OAuth.battletag('ACCESS_TOKEN')
```

#### Starcraft II Profile

To get the user's Starcraft II profile:

```ruby
BnetApi::OAuth.sc2_profile('ACCESS_TOKEN')
```

#### World of Warcraft Profile

```ruby
BnetApi::OAuth.wow_profile('ACCESS_TOKEN')
```