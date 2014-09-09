class GoogleSearch
  include PageObject

  page_url 'http://google.com'

  text_field(:criteria, name: 'q')
  button(:search, name: 'btnG')

  def perform_search
    self.criteria = 'cheezyworld'
    search
  end
  
end
