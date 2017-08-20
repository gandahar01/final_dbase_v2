class FavoriteFoodsController < ApplicationController
  before_action :current_user_must_be_favorite_food_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_favorite_food_user
    favorite_food = FavoriteFood.find(params[:id])

    unless current_user == favorite_food.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @favorite_foods = current_user.favorite_foods.page(params[:page]).per(10)

    render("favorite_foods/index.html.erb")
  end

  def show
    @favorite_food = FavoriteFood.find(params[:id])

    render("favorite_foods/show.html.erb")
  end

  def new
    @favorite_food = FavoriteFood.new

    render("favorite_foods/new.html.erb")
  end

  def create
    @favorite_food = FavoriteFood.new

    @favorite_food.favoritefood_name = params[:favoritefood_name]
    @favorite_food.foods_id = params[:foods_id]
    @favorite_food.user_id = params[:user_id]

    save_status = @favorite_food.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favorite_foods/new", "/create_favorite_food"
        redirect_to("/favorite_foods")
      else
        redirect_back(:fallback_location => "/", :notice => "Favorite food created successfully.")
      end
    else
      render("favorite_foods/new.html.erb")
    end
  end

  def edit
    @favorite_food = FavoriteFood.find(params[:id])

    render("favorite_foods/edit.html.erb")
  end

  def update
    @favorite_food = FavoriteFood.find(params[:id])

    @favorite_food.favoritefood_name = params[:favoritefood_name]
    @favorite_food.foods_id = params[:foods_id]
    @favorite_food.user_id = params[:user_id]

    save_status = @favorite_food.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favorite_foods/#{@favorite_food.id}/edit", "/update_favorite_food"
        redirect_to("/favorite_foods/#{@favorite_food.id}", :notice => "Favorite food updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Favorite food updated successfully.")
      end
    else
      render("favorite_foods/edit.html.erb")
    end
  end

  def destroy
    @favorite_food = FavoriteFood.find(params[:id])

    @favorite_food.destroy

    if URI(request.referer).path == "/favorite_foods/#{@favorite_food.id}"
      redirect_to("/", :notice => "Favorite food deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Favorite food deleted.")
    end
  end
end
