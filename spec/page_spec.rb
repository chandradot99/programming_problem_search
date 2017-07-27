require "spec_helper"

describe Page do
  before :each do
    page_keywords = ["car", "ford", "review"]
    @page = Page.new(page_keywords, 1)
  end

  describe "#new" do
    it "should return Page object" do
      expect(@page).to be_an_instance_of Page
    end

    it "should check page keywords" do
      expect(@page.keywords).to eq ["car", "ford", "review"]
    end

    it "should check page no" do
      expect(@page.page_no).to eq 1
    end
  end

  it "should calculate page weightage" do
    query1 = Query.new(["ford", "car"])
    weightage = @page.calculate_weightage(query1)
    expect(weightage).to eq 112

    query2 = Query.new(["car"])
    weightage = @page.calculate_weightage(query2)
    expect(weightage).to eq 64

    query3 = Query.new(["bike"])
    weightage = @page.calculate_weightage(query3)
    expect(weightage).to eq 0
  end
end
