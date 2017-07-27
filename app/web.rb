class Web
  attr_reader :pages
  @pages

  def initialize
    @pages = [] 
  end

  def add_new_page(page)
    @pages.push(page)
  end
end
