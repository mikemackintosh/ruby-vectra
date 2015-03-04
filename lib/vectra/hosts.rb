module Vectra
  class Hosts < Api

    attr_reader :name

    def self.target
      "hosts?page_size=50000"
    end

    def self.all
      request
    end

    def self.get(id)
      request("/#{id}", false)
    end

  end

end