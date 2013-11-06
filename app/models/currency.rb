class Currency < ActiveRecord::Base
  validates :name, presence: true
  validates :per_us_dollar, numericality: { greater_than: 0 }

  def convert_to(currency_id, amount)
    float_amount = amount.to_f
    if float_amount > 0
      other_currency = Currency.find(currency_id)
      float_amount * other_currency.per_us_dollar / self.per_us_dollar
    else
      nil
    end
  end
end
