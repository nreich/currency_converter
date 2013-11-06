namespace :db do
  desc "Update currency conversion values"
  task refresh_currencies: :environment do
    require 'currency_parser'
 
    UPDATE_URL = 'http://themoneyconverter.com/rss-feed/USD/rss.xml'
    
    parser = CurrencyParser.new(UPDATE_URL)
    currencies = parser.get_data
    currencies.each_pair do |key, value|
      Currency.find_or_create_by!(name: key) do |currency|
        currency.per_us_dollar = value
      end
    end
  end
end
