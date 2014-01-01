# encoding: utf-8

module Grandfather

  # Class for config params
  class Config
    attr_accessor :output_filename, :file, :recursive, :wkhtmltopdf_parameters, :stylesheet

    def initialize
      @output_filename = "Book.pdf"
      @recursive = false
    end
  end
end
