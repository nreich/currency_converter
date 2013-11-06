class CurrencyController < ApplicationController

  def index
    @currencies = Currency.all
    if params[:amount]
    @currency_from = Currency.find(params[:from][:currency_id])
    @currency_to = Currency.find(params[:to][:currency_id])
    @amount = params[:amount]
    @converted_amount = @currency_from.convert_to(@currency_to, @amount)
    end
  end

end
