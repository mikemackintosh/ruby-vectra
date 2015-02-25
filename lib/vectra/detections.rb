module Vectra
  class Detections < Api

    attr_reader :id

    def self.target
      "detections"
    end

    def self.all
      request
    end

    def self.get(id)
      request("/#{id}", false)
    end

  end

end