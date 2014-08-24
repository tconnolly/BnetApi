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
      
      uri = URI.parse(request_url + query)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      #http.ca_file = File.join(File.dirname(__FILE__), "../../certificates/api.battle.net.crt")
      
      puts http.ca_file
      
      #begin
        #response = JSON.parse(open(request_url + query, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }).read)
        response = http.get(uri.request_uri)
      #rescue OpenURI::HTTPError => ex
      #  handle_error_response(ex.io)
      #end
      
      return handle_response(request, response)
    end

    def self.build_query(fields)
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
        json = JSON.parse(response.body)
        case json["message"]
        when "Invalid Application"
          
        when "Access denied, please contact api-support@blizzard.com"
          
        end
      end
    end
    
    def handle_error_response(response)

    end
  end
end