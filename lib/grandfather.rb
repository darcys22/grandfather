# encoding: utf-8

require 'grandfather/version'
require 'grandfather/config'
require 'grandfather/md'
require 'grandfather/combine'
require 'grandfather/render'
require 'grandfather/code'
require 'grandfather/codeblock'
require 'grandfather/wkhtmltopdf.rb'

module Grandfather

  # Create a config object
  def self.configure
    config = Config.new
    yield config
    config
  end

  # Starts processing files
  def self.process!(config)
    @files = Path.list_valid(config.file, config.recursive).map { |file| Md.new(file) }
    Combine.new(@files, config).render!
  end
end

