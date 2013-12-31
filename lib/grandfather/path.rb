# encoding utf-8

module Grandfather

  class Path

    def self.list_valid(target, recursive = false)
      if recursive
        target ||= Dir.pwd
        if File.directory?(target)
          target = File.join(target, '**', '*')
        end
      else
        target ||= Dir.pwd
        if File.directory?(target)
          target = File.join(target, '*')
        end
      end

      @what = Dir.glob(target).select { |file| Md.new(file).valid? }
      binding.pry
      
    end
  end
end

