require 'spec_helper'

describe Currency do
  subject(:currency) { FactoryGirl.build :currency }

  it { should respond_to :name }
  it { should respond_to :per_us_dollar }
  it { should be_valid }

  describe "validations" do
    it "should require a name" do
      currency.name = ""
      expect(currency).to_not be_valid
    end
    describe "on value in us dollars" do
      it "should require a value" do
        currency.per_us_dollar = nil
        expect(currency).to_not be_valid
      end
      it "should require a numeric value" do
        currency.per_us_dollar = "abc"
        expect(currency).to_not be_valid
      end
      it "should require a positive value" do
        [0, -1, -0.00000001].each do |invalid_value|
          currency.per_us_dollar = invalid_value
          expect(currency).to_not be_valid
        end
      end
    end
  end
end


