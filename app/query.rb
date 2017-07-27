class Query
  attr_reader :keywords
  @keywords

  def initialize(keywords)
    @keywords = keywords
  end

  def keyword_weightage(keyword)
    max_keyword_weight = 8
    index = @keywords.index(keyword)
    return index ? max_keyword_weight - index : 0
  end
end
