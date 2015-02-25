require 'httparty'
require 'json'
require 'fattr'
require 'cgi'

require 'vectra/config'
require 'vectra/api'
require 'vectra/hosts'

class ErrorVectraResponse < Exception
end

module Vectra

  extend self

  def configure
    block_given? ? yield(Config) : Config
    %w(username password endpoint).each do |key|
      if Vectra::Config.instance_variable_get("@#{key}").nil?
        raise Vectra::Config::RequiredOptionMissing,
          "Configuration parameter missing: '#{key}'. " +
          "Please add it to the Vectra.configure block"
      end
    end
  end
  alias_method :config, :configure

end

Vectra.configure do |config|
  config.username = "api"
  config.password = "https://10.200.10.88/api/"
  config.endpoint = "AbpdWjFFKuu3XVdKKXjMZbard3H"
end
