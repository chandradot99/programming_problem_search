require "spec_helper"

describe Web do
  before :each do
    @web = Web.new
  end

  describe "#new" do
    it "should return Web object" do
      expect(@web).to be_an_instance_of Web
    end
  end

  describe "#pages" do
    it "returns correct pages count" do
      expect(@web.pages.length).to eql 0
    end

    it "returns wrong pages count" do
      expect(@web.pages.length).not_to eql 1
    end
  end

  it "adds new page" do
    page_keywords1 = ["car", "ford", "review"]
    page1 = Page.new(page_keywords1, 1)
    @web.add_new_page(page1)
    expect(@web.pages[0].keywords).to eql page_keywords1
    expect(@web.pages[0].page_no).to eq 1

    page_keywords2 = ["bike", "avenger", "220cc"]
    page2 = Page.new(page_keywords2, 2)
    @web.add_new_page(page2)
    expect(@web.pages[1].keywords).to eql page_keywords2
    expect(@web.pages[1].page_no).to eq 2
  end

end
