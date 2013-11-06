class CurrencyParser
  require 'net/http'
  require 'rexml/document'

  attr_accessor :currencies
  DESCRIPTION_REGEX = /([,0-9]+\.\d+)\s*(.*)/

  def initialize(url)
    @url = url
  end

  def get_data
    xml_data = Net::HTTP.get_response(URI.parse(@url)).body
    doc = REXML::Document.new(xml_data)
    currency_info  = []
    doc.elements.each("rss/channel/item/description") do |description|
      currency_info << parse_description(description.text)
    end
    Hash[currency_info]
  end

  private

  def parse_description(text)
    match = DESCRIPTION_REGEX.match(text)
    name = match[2]
    value = match[1].gsub(',','')
    [name, value]
  end

end
