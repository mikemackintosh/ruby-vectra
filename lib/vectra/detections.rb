module Vectra
  class Detections < Api

    attr_reader :id

    def self.target
      "detections?page_size=50000"
    end

    def self.all
      request
    end

    def self.get(id)
      request("/#{id}", false)
    end

  end

end