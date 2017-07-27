class Page
  attr_reader :keywords, :page_no
  @page_no
  @keywords
  
  def initialize(keywords, page_no)
    @keywords = keywords
    @page_no = page_no
  end
  
  def calculate_weightage(query)
    page_keyword_weight = 8
    page_weightage = 0
    keywords = self.keywords
    keywords.each do |keyword|
      query_keyword_weight = query.keyword_weightage(keyword)
      page_weightage += page_keyword_weight * query_keyword_weight if query_keyword_weight >= 0
      page_keyword_weight -= 1
    end
    page_weightage        
  end
end
