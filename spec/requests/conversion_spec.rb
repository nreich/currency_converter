require 'spec_helper'

describe "converting currencies" do
  let!(:currency_from) { FactoryGirl.create :currency }
  let!(:currency_to) { FactoryGirl.create(:currency, per_us_dollar: 5) }

  before do
    visit currency_index_path
    select currency_from.name, from: "from_currency_id"
    select currency_to.name, from: "to_currency_id"
    fill_in :amount, with: "1"
    click_button "Convert"
  end

  it "should display the conversion" do
    conversion_value = 0.50000
    expect(page).to have_selector "p#conversion_result", text: conversion_value
  end
end
