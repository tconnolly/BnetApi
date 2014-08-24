module BnetApi  
  class Api    
    def self.get(request, oauth = false, fields = nil)
      base_uri = "https://#{BnetApi.region}.api.battle.net/#{BnetApi.api}/"
      
      request_url = base_uri + URI::encode(request)
      
      if oauth
        query = "?access_token=#{BnetApi.oauth_token}&locale=#{BnetApi.locale}"
      elsif fields != nil
        query = self.build_query(fields)
      else
        if request_url.include?("?")
          query = "&apikey=#{BnetApi.api_key}&locale=#{BnetApi.locale}"
        else
          query = "?apikey=#{BnetApi.api_key}&locale=#{BnetApi.locale}"
        end
      end
      
      puts "Request: #{request_url}#{query}"
      
      uri = URI.parse(request_url + query)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      response = http.get(uri.request_uri)
      
      return handle_response(request, response)
    end

    def self.build_query(fields = nil)
      if fields != nil
        return "?fields=#{fields[:fields]}&apikey=#{BnetApi.api_key}&locale=#{BnetApi.locale}"
      else
        return "?apikey=#{BnetApi.api_key}&locale=#{BnetApi.locale}"
      end
    end
    
    private
    
    def self.handle_response(request, response)
      case response.code
      when "200"
        return JSON.parse(response.body)
      when "404"
        raise BnetApi::Exception::ResourceNotFoundException, "The requested resource \"#{request}\" was not found."
      when "500"
        
      end
    end
  end
end