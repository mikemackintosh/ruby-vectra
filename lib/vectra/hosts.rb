module Vectra
  class Hosts < Api

    attr_reader :name

    def self.target
      "hosts"
    end

    def self.all
      request
    end

    def self.get(id)
      request("/#{id}", false)
    end

  end

end