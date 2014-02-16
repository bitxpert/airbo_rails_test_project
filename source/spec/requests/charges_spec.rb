require 'spec_helper'

describe "Charges" do
  describe "GET /charges" do
  	before {visit charges_path}
    it "has three lists on the screen." do
	    expect(page).to have_css('table', count: 3)
    end
    it "has one list on the screen for successful charges." do
	    expect(page).to have_css('table.successful', count: 1)
    end
    it "has one list on the screen for failed charges." do
	    expect(page).to have_css('table.failed', count: 1)
    end
    it "has one list on the screen for disputed charges." do
	    expect(page).to have_css('table.disputed', count: 1)
    end
    it "has 10 line items in the successful list." do
	    expect(page).to have_css('table.successful tbody tr', count: 10)
    end
    it "has 5 line items in the failed list." do
	    expect(page).to have_css('table.failed tbody tr', count: 5)
    end
    it "has 5 line items in the disputed list." do
	    expect(page).to have_css('table.disputed tbody tr', count: 5)
    end
  end
end
