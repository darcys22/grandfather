# encoding: utf-8

module Grandfather

  class Renderer
    def initialize(file)
      @file = file
      
      @data = file.data
      @code = Code.new
    end

    def render
      prepare_data
      render_data
      post_process_data

      return @data
    end

    private

    def prepare_data
      @data = @code.extract(@data)
    end

    def render_data
      begin
        @data = @data.force_encoding('utf-8') if @data.respond_to? :force_encoding
        @data = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :tables => true).render(content)
        if @data.nil?
          raise "There was an error converting #{@file.name} to HTML."
        end
      end
    end

    def post_process_data
      @data = @code.process(@data)
      doc = Nokogiri::HTML::DocumentFragment.parse(@data, 'UTF-8')
      @data = doc.to_xhtml(:save_with => Nokofiri::XML::Node::SaveOptions::AS_XHTML, :encoding => 'UTF-8')
      @data.gsub!(/<p><\/P>/, '')
    end
  end
end
