require_relative "./app/web"
require_relative "./app/page"
require_relative "./app/query"
require_relative "./app/search_engine"

web = Web.new
page_index = 1
query_index = 1

loop do
  input = gets.chomp
  input_array = input.split(" ")
  input_array.map!(&:downcase)
  input_type = input_array[0]
  input_array.shift

  if (input_type == 'p')
    page_no = "P#{page_index}"
    page = Page.new(input_array, page_no)
    web.add_new_page(page)
    page_index += 1
  elsif (input_type == 'q')
    query = Query.new(input_array)
    searchEngine = SearchEngine.new
    searchEngine.search_web(query, web)
    pages = searchEngine.search_results
    print "Q#{query_index}:"
    pages.each do |page|
      print " #{page} "
    end
    query_index += 1
    puts
  end

end
