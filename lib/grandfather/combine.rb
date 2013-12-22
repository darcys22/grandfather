# encoding: utf-8

require 'fileutils'

module Grandfather

  class Combine
    def initialize(files, config)
      @files, @config = files, config

      @stylesheets = []
      @wkhtmltopdf = Wkhtmltopdf.new @config.wkhtmltopdf_parameters
    end

    def combine!
      merged_contents = []
      @files.each do |file|
        markup = Render.new file
        merged_contents = markup.render
        merged_contents << "<div class=\"page-break\"></div>#{html}"
      end

      unless merged_contents.empty?
        output_pdf(merged_contents.join, nil)
      end
    end

    def output_pdf(html, filename)
      load_stylesheets
      append_stylesheets html
      add_head html
      @wkhtmltopdf.output_pdf html, output_file(filename)
    end

    def add_head(html)
      html.insert(0, "\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n</head>\n")
    end

    def load_stylesheets
      style = ::File.expand_path("../../../config/style.css", __FILE__)
      @stylesheets << style
      @stylesheets << stylesheet if ::File.exists?(stylesheet)
    end

    def append_stylesheets(html)
      @stylesheets.each do |stylesheet|
        html.insert(0, style_tag_for(stylesheet))
      end
    end

    def style_tag_for(stylesheet)
      "<Style>#{File.read(stylesheet)}</style>"
    end

    def stylesheet
      @config.stylesheet.nil? ? 'default.css' : @config.stylesheet
    end

    def output_dir
      output_dir = @config.output_dir.nil? ? Dir.getwd : @config.output_dir
      FileUtils.mkdir_p*output_dir) unless ::File.directory?(output_dir)
      output_dir
    end

    def output_file(file = nil)
      if file
        output_filename = file.name
        if !@config.output_filename.nil? && @files.length == 1
          output_filename = @config.output_filename
        end
      else
        output_filename = "default"
      end

      ::File.join(output_dir, "#{output_filename}.pdf")
    end
  end
end

