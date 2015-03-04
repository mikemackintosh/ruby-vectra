module Vectra
  class API
    class InvalidResponse < RuntimeError ; end
    
    include HTTParty    

    def self.pull(url)

      # Set the endpoint
      unless Vectra::Config.endpoint.include? "/api"
        Vectra::Config.endpoint = "#{Vectra::Config.endpoint}/api"
      end
      base_uri Vectra::Config.endpoint

      # Right now, they don't support signed Certs
      default_options.update(verify: false)

      # Set basic auth
      default_options.update(basic_auth: {username: Vectra::Config.username, password: Vectra::Config.password})

      # Default the result set
      results = []
      
      # Send the request
      response = get(url)

      # Check the response
      if !response.code.eql?(200)
        raise Vectra::API::InvalidResponse, "Invalid Response Received"
      end

      #response = response.response_parse
      if response.parsed_response.has_key? "next"
        unless response.parsed_response["next"].nil?
          results.concat(self.pull(response.parsed_response["next"]))
        end
      end

      # Merge the results into results
      if response.parsed_response.has_key? "results"
        results.concat(response.parsed_response["results"])
      else
        return response.parsed_response
      end

      # Sort the results and spit them out
      results.sort!{|a,b| a['id']<=>b['id']}

    end

  end
end