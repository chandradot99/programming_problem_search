require "spec_helper"

describe Query do
  before :each do
    query_keywords = ["car", "ford"]
    @query = Query.new(query_keywords)
  end

  describe "#new" do
    it "should return Query object" do
      expect(@query).to be_an_instance_of Query
    end

    it "should check query keywords" do
      expect(@query.keywords).to eq ["car", "ford"]
    end
  end

  it "should return keyword weightage" do
    weightage = @query.keyword_weightage("car")
    expect(weightage).to eq 8

    weightage = @query.keyword_weightage("ford")
    expect(weightage).to eq 7

    weightage = @query.keyword_weightage("review")
    expect(weightage).to eq 0
  end
end
