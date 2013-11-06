class Currency < ActiveRecord::Base
  validates :name, presence: true
  validates :per_us_dollar, numericality: { greater_than: 0 }
end
