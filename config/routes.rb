Collabdoc::Application.routes.draw do
  root to: "public#index"

  #static pages
  ["about", "contact"].each do |page|
    get page
  end
end
