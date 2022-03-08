require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe "full_title" do
    it "returns the title with Disaster Resource Network added" do
      page_title = "FAKE_TITLE"
 
      expect(full_title(page_title)).to eq("FAKE_TITLE | Disaster Resource Network")
    end
  end
  
end
