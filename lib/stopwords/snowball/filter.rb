module Stopwords
  module Snowball
    class Filter < Stopwords::Filter
      attr_reader :locale
      attr_reader :locale_filename

      def initialize locale, custom_list = [], custom_file = nil
        @locale = locale
        @locale_filename = if custom_file.nil?
          "#{File.dirname(__FILE__)}/locales/#{locale}.csv"
        else
          custom_file
        end

        raise ArgumentError.new("Unknown locale: #{locale.inspect}") unless File.exists?(@locale_filename)
        super File.read(@locale_filename).split(",") + custom_list
      end
    end
  end
end
