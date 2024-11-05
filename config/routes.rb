Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/new", { :controller => "directors", :action => "new" }) # Form to create new director
  post("/directors", { :controller => "directors", :action => "create" }) # Action to save new director
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  get("/directors/:path_id/edit", { :controller => "directors", :action => "edit" }) # Form to edit director
  patch("/directors/:path_id", { :controller => "directors", :action => "update" }) # Update director
  delete("/directors/:path_id", { :controller => "directors", :action => "destroy" }) # Delete director
  
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/new", { :controller => "movies", :action => "new" }) # Form to create new movie
  post("/movies", { :controller => "movies", :action => "create" }) # Save new movie
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  get("/movies/:path_id/edit", { :controller => "movies", :action => "edit" }) # Form to edit movie
  patch("/movies/:path_id", { :controller => "movies", :action => "update" }) # Update movie
  delete("/movies/:path_id", { :controller => "movies", :action => "destroy" }) # Delete movie

  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/new", { :controller => "actors", :action => "new" }) # Form to create new actor
  post("/actors", { :controller => "actors", :action => "create" }) # Save new actor
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  get("/actors/:path_id/edit", { :controller => "actors", :action => "edit" }) # Form to edit actor
  patch("/actors/:path_id", { :controller => "actors", :action => "update" }) # Update actor
  delete("/actors/:path_id", { :controller => "actors", :action => "destroy" }) 

end
