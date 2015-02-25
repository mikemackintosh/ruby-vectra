module Vectra
  class Api

    include HTTParty

    def self.request
      response = HTTParty.get( 
        "#{Vectra::Config.endpoint}#{self.target}",
        :verify => false, 
        :basic_auth => { 
          :username => Vectra::Config.username, 
          :password => Vectra::Config.password
      })

      puts response.inspect
    end

  end
end