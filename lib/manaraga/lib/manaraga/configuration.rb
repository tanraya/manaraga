module Manaraga
  class Configuration
    attr_reader :config

    def initialize
      @config = OpenStruct.new
    end

    def method_missing(m, *args, &block)
      @config.send(m, *args, &block)
    end
  end
end
