Rails.application.routes.draw do
  # Routes for the Food resource:
  # CREATE
  get "/foods/new", :controller => "foods", :action => "new"
  post "/create_food", :controller => "foods", :action => "create"

  # READ
  get "/foods", :controller => "foods", :action => "index"
  get "/foods/:id", :controller => "foods", :action => "show"

  # UPDATE
  get "/foods/:id/edit", :controller => "foods", :action => "edit"
  post "/update_food/:id", :controller => "foods", :action => "update"

  # DELETE
  get "/delete_food/:id", :controller => "foods", :action => "destroy"
  #------------------------------

  # Routes for the Weekly_workout resource:
  # CREATE
  get "/weekly_workouts/new", :controller => "weekly_workouts", :action => "new"
  post "/create_weekly_workout", :controller => "weekly_workouts", :action => "create"

  # READ
  get "/weekly_workouts", :controller => "weekly_workouts", :action => "index"
  get "/weekly_workouts/:id", :controller => "weekly_workouts", :action => "show"

  # UPDATE
  get "/weekly_workouts/:id/edit", :controller => "weekly_workouts", :action => "edit"
  post "/update_weekly_workout/:id", :controller => "weekly_workouts", :action => "update"

  # DELETE
  get "/delete_weekly_workout/:id", :controller => "weekly_workouts", :action => "destroy"
  #------------------------------

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
