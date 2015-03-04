module Vectra
  class DetectionDetails

    attr_accessor :target
    @target = "/detection_details"

    def self.all
      Vectra::API.pull(@target)
    end

    def each
      self.all.each do |host|
        yield host
      end
    end 

    def self.get(id)
      unless id.is_a? Integer
        id = id.split("/").last
      end

      Vectra::API.pull("#{@target}/#{id}")
    end

  end

end