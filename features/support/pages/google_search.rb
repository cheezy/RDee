class GoogleSearch
  include PageObject

  page_url 'http://google.com'

  text_field(:criteria, name: 'q')

  def perform_search
    self.criteria = 'cheezyworld'
  end
  
end
