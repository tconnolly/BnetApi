module BnetApi
  class Config
    def self.load_config(config)
      @@config = config
    end
  end
end