module BnetApi
  module WoW
    # All API methods relating to World of Warcraft Data are contained in this module.
    module Data
      extend self

      # Retrieves all battlegroups for the region.
      #
      # @return [Hash] A hash containing the battlegroups.
      def battlegroups
        BnetApi::make_request('/wow/data/battlegroups/')
      end

      # Retrieves all character races.
      #
      # @return [Hash] A hash containing the character races.
      def character_races
        BnetApi::make_request('/wow/data/character/races')
      end

      # Retrieves all character classes.
      #
      # @return [Hash] A hash containing the character classes.
      def character_classes
        BnetApi::make_request('/wow/data/character/classes')
      end

      # Retrieves all character achievements.
      #
      # @return [Hash] A hash containing the character achievements.
      def character_achievements
        BnetApi::make_request('/wow/data/character/achievements')
      end

      # Retrieves all guild rewards.
      #
      # @return [Hash] A hash containing the guild rewards.
      def guild_rewards
        BnetApi::make_request('/wow/data/guild/rewards')
      end

      # Retrieves all guild perks.
      #
      # @return [Hash] A hash containing the guild perks.
      def guild_perks
        BnetApi::make_request('/wow/data/guild/perks')
      end

      # Retrieves all guild achievements.
      #
      # @return [Hash] A hash containing the guild achievements.
      def guild_achievements
        BnetApi::make_request('/wow/data/guild/achievements')
      end

      # Retrieves all item classes.
      #
      # @return [Hash] A hash containing the item classes.
      def item_classes
        BnetApi::make_request('/wow/data/item/classes')
      end

      # Retrieves all talents.
      #
      # @return [Hash] A hash containing the talents.
      def talents
        BnetApi::make_request('/wow/data/talents')
      end

      # Retrieves all pet types.
      #
      # @return [Hash] A hash containing the pet types.
      def pet_types
        BnetApi::make_request('/wow/data/pet/types')
      end

    end
  end
end