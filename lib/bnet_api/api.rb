module BnetApi  
  class Api    
    def self.get(request, oauth = false, fields = nil)
      base_uri = "https://#{BnetApi.region}.api.battle.net/#{BnetApi.api}/"
      
      request_url = base_uri + URI::encode(request)
      
      if oauth
        query = "?access_token=#{BnetApi.oauth_token}&locale=#{BnetApi.locale}"
      else
        query = self.build_query(fields)
      end
      
      if query == nil
        query = ""
      end
      puts "Requesting: #{request_url}#{query}"
      
      response = nil
      
      begin
        response = JSON.parse(open(request_url + query, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }).read)
      rescue OpenURI::HTTPError => ex
        response = JSON.parse(ex.io.readlines)
        puts response
      end
      
      return response
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