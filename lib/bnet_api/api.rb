module BnetApi  
  class Api    
    def self.get(request, fields = nil)
      base_uri = "https://#{config.region}.api.battle.net/#{config.api}/"
      
      request_url = base_uri + URI::encode(request)
      query = self.build_query(fields)
      
      if query == nil
        query = ""
      end
      
      return JSON.parse(open(request_url + query, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }).read)
    end

    def self.build_query(fields)
      if fields != nil
        return "?fields=#{fields[:fields]}&apikey=#{config.api_key}&locale=#{config.locale}"
      else
        return "?apikey=#{config.api_key}&locale=#{config.locale}"
      end
    end
  end
end