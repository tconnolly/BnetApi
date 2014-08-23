module BnetApi  
  class Api    
    def self.get(request, fields = nil)
      base_uri = "https://#{BnetApi.region}.api.battle.net/#{BnetApi.api}/"
      
      request_url = base_uri + URI::encode(request)
      query = self.build_query(fields)
      
      if query == nil
        query = ""
      end
      puts "Requesting: #{request_url}#{query}"
      return JSON.parse(open(request_url + query, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }).read)
    end

    def self.build_query(fields)
      if fields != nil
        return "?fields=#{fields[:fields]}&apikey=#{BnetApi.api_key}&locale=#{BnetApi.locale}"
      else
        return "?apikey=#{BnetApi.api_key}&locale=#{BnetApi.locale}"
      end
    end
  end
end