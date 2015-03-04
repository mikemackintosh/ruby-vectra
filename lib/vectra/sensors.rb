module Vectra
  class Sensors

    attr_reader :id

    def self.target
      "sensors"
    end

    def self.all
      request
    end

    def self.get(id)
      request("/#{id}", false)
    end

  end

end