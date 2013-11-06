class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.decimal :per_us_dollar

      t.timestamps
    end
  end
end
