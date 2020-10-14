Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  match "movies/find_similar_movies/:id" => 'movies#find_similar_movies', :as => :find_similar_movies, :via => :get
end
