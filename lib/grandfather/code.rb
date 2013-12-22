# encoding: utf-8

module Grandfather
  class Code

    def initialize
      @code_blocks = []
    end

    def extract(data)
      data.gsub!(/^``` ?([^\r\n]+)?\r?\n(.+?)\r?\n```\r?$/m) do
        id = Digest::SHA1.hexdigest($2)
        @code_blocks << CodeBlock.new(id, $1, $2)
      end
      data
    end

    def process(data)
      return data if data.nil? || data.size.zero? || @code_blocks.size.zero?
      @code_blocks.each do |block|
        data.gsub!(block.id, block.highlighted)
      end
      data
    end
  end
end

