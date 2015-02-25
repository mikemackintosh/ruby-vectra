require 'httparty'
require 'json'
require 'fattr'
require 'cgi'

require 'vectra/config'
require 'vectra/api'
require 'vectra/hosts'
require 'vectra/detections'
require 'vectra/sensors'
require 'vectra/rules'

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