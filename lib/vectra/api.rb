module Vectra
  class Api

    include HTTParty

    def initialize
      puts Vectra::Config.inspect
      %w(username password endpoint).each do |key|
        if Vectra::Config.instance_variable_get("@#{key}").nil?
          raise Vectra::Config::RequiredOptionMissing,
            "Configuration parameter missing: '#{key}'. " +
            "Please add it to the Vectra.configure block"
        end
      end
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