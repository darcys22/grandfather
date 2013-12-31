# encoding: utf-8

require_relative 'grandfather/version'
require_relative 'grandfather/config'
require_relative 'grandfather/md'
require_relative 'grandfather/combine'
require_relative 'grandfather/render'
require_relative 'grandfather/code'
require_relative 'grandfather/codeblock'
require_relative 'grandfather/wkhtmltopdf'
require_relative 'grandfather/path'

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
    binding.pry
    Combine.new(@files, config).combine!
  end
end

