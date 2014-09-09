class CheezyWorld
  include PageObject

  page_url 'http://cheezyworld.com'

  h2(:transformations, class: 'post-title')
  
end
