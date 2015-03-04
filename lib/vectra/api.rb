module Vectra
  class Api
    class InvalidResponse < RuntimeError ; end

    include HTTParty

    def self.send(url, args="", decode)
      results = []

      # Send the request
      response = HTTParty.get( 
        "#{url}#{args}?page_size=100000",
        :verify => false, # Vectra doesnt accept real certs yet
        :basic_auth => { 
          :username => Vectra::Config.username, 
          :password => Vectra::Config.password
      })

      if !response.code.eql?(200)
        raise Vectra::Api::InvalidResponse, "Invalid Response Received"
      end

      # Decode the response
      response = JSON.parse response.body

      # Check if we should decode this response
      if decode
        # Map responses
        response['results'].map{|r| results.push(r)}
      else
        results = response
      end

      # If there is a next, respect it
      #unless response['next'].nil?
      #  puts self.send(response['next']).inspect
      #end

      results

    end

    def self.request(args="", decode=true)
      r = self.send("#{Vectra::Config.endpoint}#{self.target}", args, decode)
      r
    end

  end
end