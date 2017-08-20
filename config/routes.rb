Rails.application.routes.draw do
  # Routes for the Daily_workout resource:
  # CREATE
  get "/daily_workouts/new", :controller => "daily_workouts", :action => "new"
  post "/create_daily_workout", :controller => "daily_workouts", :action => "create"

  # READ
  get "/daily_workouts", :controller => "daily_workouts", :action => "index"
  get "/daily_workouts/:id", :controller => "daily_workouts", :action => "show"

  # UPDATE
  get "/daily_workouts/:id/edit", :controller => "daily_workouts", :action => "edit"
  post "/update_daily_workout/:id", :controller => "daily_workouts", :action => "update"

  # DELETE
  get "/delete_daily_workout/:id", :controller => "daily_workouts", :action => "destroy"
  #------------------------------

  # Routes for the Favorite_food resource:
  # CREATE
  get "/favorite_foods/new", :controller => "favorite_foods", :action => "new"
  post "/create_favorite_food", :controller => "favorite_foods", :action => "create"

  # READ
  get "/favorite_foods", :controller => "favorite_foods", :action => "index"
  get "/favorite_foods/:id", :controller => "favorite_foods", :action => "show"

  # UPDATE
  get "/favorite_foods/:id/edit", :controller => "favorite_foods", :action => "edit"
  post "/update_favorite_food/:id", :controller => "favorite_foods", :action => "update"

  # DELETE
  get "/delete_favorite_food/:id", :controller => "favorite_foods", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
