module Vectra
  class Api
    class InvalidResponse < RuntimeError ; end

    include HTTParty

    def self.send(url, args="")
      results = []

      # Send the request
      response = HTTParty.get( 
        "#{url}#{args}",
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

      # Map responses
      response['results'].map{|r| results.push(r)}

      # If there is a next, respect it
      #unless response['next'].nil?
      #  puts self.send(response['next']).inspect
      #end

      results

    end

    def self.request
      r = self.send("#{Vectra::Config.endpoint}#{self.target}")
      puts r.inspect
    end

  end
end