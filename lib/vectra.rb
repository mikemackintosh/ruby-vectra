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
  end
  alias_method :config, :configure

  #self.api = Vectra::Api.new

end

Vectra.configure do |config|
  config.username = "api"
  config.password = "https://10.200.10.88/api/"
  config.endpoint = "AbpdWjFFKuu3XVdKKXjMZbard3H"
end
