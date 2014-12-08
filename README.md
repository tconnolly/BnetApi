# BnetApi

[![Gem Version](https://badge.fury.io/rb/bnet_api.svg)](http://badge.fury.io/rb/bnet_api)

A Ruby wrapper for the Battle.net API

## Current Version: 0.1.1

### Status

        API       | Status
------------------|-----------------
World of Warcraft | Implemented
Diablo III        | Not implemented
Starcraft II      | Not implemented

## Installation

TODO

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

For more detailed documentation visit the official documentation (https://dev.battle.net).

### Achievement API

To get the data for an achievement:

```ruby
BnetApi::WoW.achievement(2144)
```

### Auction Data API

The Auction Data API returns the URL of a JSON file containing an auction data dump generated at the time of the `lastModified` return value.

#### Sample Request

```ruby
BnetApi::WoW.auction_data('Thunderhorn')
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
BnetApi::WoW.challenge_mode_realm('Thunderhorn')
```

#### Region

To get the challenge mode leaderboard for the region:

```ruby
BnetApi::WoW.challenge_mode_region
```

### Character Profile API

To get the basic data for a character:

```ruby
BnetApi::WoW.character('Thunderhorn', 'Ragwolf')
```

To get any additional data fields, pass them in as extra symbol values:

```ruby
BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :achievements, :quests)
```

To get all additional data fields, pass in :all as the extra parameter:

```ruby
BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :all)
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
BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution')
```

To get any additional data fields, pass them in as extra symbol values:

```ruby
BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :news, :achievements)
```

To get all additional data fields, pass in :all as the extra parameter:

```ruby
BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :all)
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
