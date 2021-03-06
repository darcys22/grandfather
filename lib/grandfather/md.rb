# encoding: utf-8

module Grandfather

  # Class load files and determine if valid
  class Md
    attr_reader :filename, :name, :data

    def initialize(filename)
      @filename = filename
      @extension = ::File.extname(@filename)
      @name = ::File.basename(@filename, @extension)
      @data = ::File.open(@filename, 'rb' ) { |f| f.read } if ::File.exists?(@filename)
    end

    def valid?
      valid_format? @extension
    end

    def valid_format?(format)
      # All the files are missing extensions, if it has an extension it is wrong
        # kinda hacky not happy with it
      format.empty?
      #return false if format.nil?

      #format.to_sym == :md
    end

  end
end
