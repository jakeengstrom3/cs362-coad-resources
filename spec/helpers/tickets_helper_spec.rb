require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TicketsHelper. For example:
#
describe TicketsHelper do
  describe "string concat" do
    it "concats two strings with spaces" do
      combined_string = ("this "+"that")
      expect(combined_string).to eq("this that")
    end
  end
end
RSpec.describe TicketsHelper, type: :helper do
  describe "format_phone_number" do
    it "formats phone number" do
      expect(format_phone_number('+1(123)-456-7890')).to eq("+11234567890")
    end
  end
end
