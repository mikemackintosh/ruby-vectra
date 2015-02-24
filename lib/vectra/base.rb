module Vectra
  class Base
    
    fattr :endpoint

    # Init the class
    def initialize(token, &block)
    
      instance_eval(&block) if block_given?
    end

  end
end