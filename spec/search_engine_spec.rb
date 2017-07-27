require "spec_helper"

describe SearchEngine do
  before :each do
    @search_engine = SearchEngine.new
  end

  describe "#new" do
    it "should return SearchEngine object" do
      expect(@search_engine).to be_an_instance_of SearchEngine
    end
  end

  it "should search web" do
    web = Web.new
    page1 = Page.new(["ford", "car", "review"], 'P1')
    web.add_new_page(page1)
    page2 = Page.new(["toyota", "car"], 'P2')
    web.add_new_page(page2)
    page3 = Page.new(["car", "ford"], 'P3')
    web.add_new_page(page3)

    query1 = Query.new(["ford", "car"])
    @search_engine.search_web(query1, web)
    expect(@search_engine.search_results).to eq ["P1", "P3", "P2"]

    search_engine = SearchEngine.new
    query2 = Query.new(["ford", "review"])
    search_engine.search_web(query2, web)
    expect(search_engine.search_results).to eq ["P1", "P3"]
  end

end
