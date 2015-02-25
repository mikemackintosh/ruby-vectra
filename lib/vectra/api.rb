module Vectra
  class Api

    include HTTParty

    def initialize
      puts "Here!"
     
      options = {
        username: Vectra.config.username,
        password: Vectra.config.password,
        endpoint: Vectra.config.endpoint
      }
    end

    def request
      puts self.target
    end

  end
end