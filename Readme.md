# BnetApi

## Installation

TODO

## Configuration

You need to set at least the Battle.net API key in the configuration, either in the code or in an initializer.

You can also change the region of the API to query and the locale of the returned data.

	BnetApi.config.api_key = 'YOUR_API_KEY'
	BnetApi.config.api_secret = 'YOUR_API_SECRET'

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

## Examples

Each API method returns a hash containing the values returned from the API.

For more detailed documentation visit the official documentation (https://dev.battle.net).

### Achievement API

To get the data for an achievement:

	BnetApi::WoW.achievement(2144)

### Auction Data API

The Auction Data API returns the URL of a JSON file containing an auction data dump generated at the time of the `lastModified` return value.

#### Sample Request

	BnetApi::WoW.auction_data('Thunderhorn')

#### Sample Response

	{
		"files": [
			{
				"url": "http://eu.battle.net/auction-data/7181c5e54bd6d781d46bdadec17e3637/auctions.json",
				"lastModified": 1418050857000
			}
		]
	}

### Battlepet API

#### Battlepet Abilities

To get a battlepet ability from the API:

  BnetApi::WoW.battlepet_ability(640)

#### Battlepet Species

To get a battlepet species from the API:

  BnetApi::WoW.battlepet_species(258)

#### Battlepet Stats

To get the default stats for a battlepet:

  BnetApi::WoW.battlepet_stats(258)

The Battlepet Stats API also has three optional parameters:

* level
* breedId
* qualityId

Any or all of these can be passed in as named parameters after the species ID:

  BnetApi::WoW.battlepet_stats(258, level: 25, breedId: 5, qualityId: 4)

### Challenge Mode API

#### Realm

To get the challenge mode leaderboard for a realm:

  BnetApi::WoW.challenge_mode_realm('Thunderhorn')

#### Region

To get the challenge mode leaderboard for the region:

  BnetApi::WoW.challenge_mode_region

### Character Profile API

To get the basic data for a character:

	BnetApi::WoW.character('Thunderhorn', 'Ragwolf')

To get any additional data fields, pass them in as extra symbol values:

	BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :achievements, :quests)

To get all additional data fields, pass in :all as the extra parameter:

	BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :all)

Available optional fields:

* :achievements
* :appearance
* :feed
* :guild
* :items
* :mounts
* :pets
* :petSlots
* :progression
* :pvp
* :quests
* :reputation
* :stats
* :talents
* :titles
* :audit

### Guild API

To get the basic data for a guild:

  BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution')

To get any additional data fields, pass them in as extra symbol values:
  
  BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :news, :achievements)

To get all additional data fields, pass in :all as the extra parameter:

  BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :all)

Available optional fields:

* :members
* :achievements
* :news
* :challenge

### Item API

To get the data for an item:

  BnetApi::WoW.item(18803)

To get the data for an item set:

  BnetApi::WoW.item_set(1060)

### PvP API

To get the PvP leaderboard for a bracket:

  BnetApi::WoW.pvp('2v2')

Available brackets:

* 2v2
* 3v3
* 5v5
* rbg

### Quest API

To get the data for a quest:

  BnetApi::WoW.quest(13146)

### Realm Status API

To get the status of all realms in the region:

  BnetApi::WoW.realm_status

### Recipe API

To get the data for a recipe:

  BnetApi::WoW.recipe(33994)

### Spell API

To get the data for a spell:

  BnetApi::WoW.spell(8056)