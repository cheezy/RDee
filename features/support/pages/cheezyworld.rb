class CheezyWorld
  include PageObject

  page_url 'http://cheezyworld.com'

  h1(:first_heading, class: 'entry-title')
  
end
