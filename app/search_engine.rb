class SearchEngine
  attr_reader :search_results
  @search_results
  @ranked_pages

  def initialize
    @search_results = []
    @ranked_pages = []
  end

  def search_web(query, web)
    pages = web.pages
    pages.each do |page|
      weightage = page.calculate_weightage(query)
      add_to_ranked_pages(page, weightage) if weightage > 0
    end
    add_pages_to_search_results
  end

  private
  def add_to_ranked_pages(page, weightage)
    page_rank = (0...@ranked_pages.size).bsearch {|i| @ranked_pages[i][:weightage] < weightage }
    if (page_rank)
      @ranked_pages.insert(page_rank, {page: page, weightage: weightage})
    else
      @ranked_pages.push({page: page, weightage: weightage})
    end
  end

  def add_pages_to_search_results
    @ranked_pages.each_with_index do |ranked_page, index|
      page_no = @ranked_pages[index][:page].page_no
      @search_results.push(page_no)
      break if index == 4
    end
  end
end
