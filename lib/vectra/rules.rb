module Vectra
  class Rules
    
    attr_reader :id

    def self.target
      "rules"
    end

    def self.all
      request
    end

    def self.get(id)
      request("/#{id}", false)
    end

  end

end