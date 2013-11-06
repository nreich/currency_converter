namespace :db do
  desc "Update currency conversion values"
  task refresh_currencies: :environment do
    require 'currency_parser'
 
    UPDATE_URL = 'http://themoneyconverter.com/rss-feed/USD/rss.xml'
    
    Currency.delete_all
    parser = CurrencyParser.new(UPDATE_URL)
    currencies = parser.get_data
    currencies.each_pair do |key, value|
      Currency.create(name: key, per_us_dollar: value.to_d)
    end
  end
end
