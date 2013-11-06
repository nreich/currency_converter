class ChangePrecisionAndScaleOfCurrencies < ActiveRecord::Migration
  def change
    change_column :currencies, :per_us_dollar, :decimal, precision: 16, scale: 5
  end
end
