require 'spec_helper'

describe Currency do
  subject(:currency) { FactoryGirl.build :currency }

  it { should respond_to :name }
  it { should respond_to :per_us_dollar }
  it { should respond_to :convert_to }
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

  describe "converting to another currency" do
    let(:second_currency) { FactoryGirl.create(:currency, per_us_dollar: 5) }
    before { currency.save }
    context "given a valid amount" do
      it "should return the right value" do
        conversion = currency.convert_to(second_currency.id, 1)
        expect(conversion).to be_within(0.01).of(0.5)
      end
    end
    context "given an invalid quantity" do
      it "should return 'nil' for negative numbers" do
        conversion = currency.convert_to(second_currency.id, -10)
        expect(conversion).to be_nil
      end
      it "should return 'nil' for non-number inputs" do
        conversion = currency.convert_to(second_currency.id, "text")
        expect(conversion).to be_nil
      end
    end
  end

end


