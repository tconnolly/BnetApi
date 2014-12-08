module BnetApi
  module WoW
    module Data
      extend self

      def battlegroups
        BnetApi::make_request('/wow/data/battlegroups/')
      end

      def character_races
        BnetApi::make_request('/wow/data/character/races')
      end

      def character_classes
        BnetApi::make_request('/wow/data/character/classes')
      end

      def character_achievements
        BnetApi::make_request('/wow/data/character/achievements')
      end

      def guild_rewards
        BnetApi::make_request('/wow/data/guild/rewards')
      end

      def guild_perks
        BnetApi::make_request('/wow/data/guild/perks')
      end

      def guild_achievements
        BnetApi::make_request('/wow/data/guild/achievements')
      end

      def item_classes
        BnetApi::make_request('/wow/data/item/classes')
      end

      def talents
        BnetApi::make_request('/wow/data/talents')
      end

      def pet_types
        BnetApi::make_request('/wow/data/pet/types')
      end

    end
  end
end