# encoding: utf-8

module Grandfather

  # Class for config params
  class Config
    attr_accessor :output_filename

    def initialize
      @output_filename = "Book.pdf"
    end
  end
end
