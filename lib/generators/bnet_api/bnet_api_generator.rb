require 'rails/generators'

module BnetApi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      # API to use
      class_option :api, type: :string, default: "wow"
      
      # Region to use
      class_option :region, type: :string, default: "eu"
      
      # Locale to use
      class_option :locale, type: :string, default: "en_GB"
      
      # Application's API key
      class_option :api_key, type: :string
      
      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), "templates"))
      end
      
      # Copy configuration
      def copy_initializer
        template "bnet_api.rb", "config/initializers/bnet_api.rb"
      end
      
    end
  end
end