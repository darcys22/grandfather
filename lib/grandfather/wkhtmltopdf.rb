module Grandfather
  class Wkhtmltopdf

    def initialize(parameters = nil)
      @parameters = parameters
    end

    def output_pdf(html, filename)
      args = command(filename)
      invoke = args.join(' ')

      IO.popen(invoke, "wb+") do |pdf|
        pdf.puts(html)
        pdf.close_write
        pdf.gets(nil)
      end
    end

    def command(filename)
      [bin, @parameters, '--quiet', '-', "\"#{filename}\""].compact
    end

    def bin
      @bin ||= "\"#{(`which wkhtmltopdf`).chomp}\""
    end
  end
end
