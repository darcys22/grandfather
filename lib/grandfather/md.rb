# encoding: utf-8

module Grandfather

  # Class load files and determine if valid
  class Md
    attr_reader :filename, :name, :data

    def initialize(filename)
      @filename = filename
      extension = ::File.extname(@filename)
      @name = ::File.basename(@filename, extension)
      @data = ::File.open(@filename, 'rb' ) { |f| f.read } if ::File.exists?(@filename)
    end
  end
end
