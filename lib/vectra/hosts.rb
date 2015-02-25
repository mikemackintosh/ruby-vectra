module Vectra
  class Hosts < Api
    fattr target: "/hosts"

    def self.all
      get 
    end

    def get_host

    end

  end

end