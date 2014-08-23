module BnetApi  
  class Api    
    def self.get(request, fields = nil)
      base_uri = "https://#{Config::REGION}.api.battle.net/#{Config::API}/"
      
      request_url = base_uri + URI::encode(request)
      query = self.build_query(fields)
      
      if query == nil
        query = ""
      end
      
      return JSON.parse(open(request_url + query, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }).read)
    end

    def self.build_query(fields)
      if fields != nil
        return "?fields=#{fields[:fields]}&apikey=#{Config::API_KEY}&locale=#{Config::LOCALE}"
      else
        return "?apikey=#{Config::API_KEY}&locale=#{Config::LOCALE}"
      end
    end
  end
end