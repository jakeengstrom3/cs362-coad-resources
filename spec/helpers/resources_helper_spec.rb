require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ResourcesHelper. For example:
#
describe ResourcesHelper do
  describe "string concat" do
    it "concats two strings with spaces" do
      combined_string = ("this "+"that")
      expect(combined_string).to eq("this that")
    end
  end
end
RSpec.describe ResourcesHelper, type: :helper do
  # pending "add some examples to (or delete) #{__FILE__}"
end
