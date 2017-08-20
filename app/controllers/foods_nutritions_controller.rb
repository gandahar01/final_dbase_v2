class FoodsNutritionsController < ApplicationController
  def index
    @foods_nutritions = FoodsNutrition.page(params[:page]).per(10)

    render("foods_nutritions/index.html.erb")
  end

  def show
    @foods_nutrition = FoodsNutrition.find(params[:id])

    render("foods_nutritions/show.html.erb")
  end

  def new
    @foods_nutrition = FoodsNutrition.new

    render("foods_nutritions/new.html.erb")
  end

  def create
    @foods_nutrition = FoodsNutrition.new

    @foods_nutrition.foods_id = params[:foods_id]
    @foods_nutrition.foodscatagory_id = params[:foodscatagory_id]
    @foods_nutrition.foods_calories = params[:foods_calories]
    @foods_nutrition.foods_carbs = params[:foods_carbs]
    @foods_nutrition.foods_fat = params[:foods_fat]
    @foods_nutrition.foods_sugar = params[:foods_sugar]

    save_status = @foods_nutrition.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods_nutritions/new", "/create_foods_nutrition"
        redirect_to("/foods_nutritions")
      else
        redirect_back(:fallback_location => "/", :notice => "Foods nutrition created successfully.")
      end
    else
      render("foods_nutritions/new.html.erb")
    end
  end

  def edit
    @foods_nutrition = FoodsNutrition.find(params[:id])

    render("foods_nutritions/edit.html.erb")
  end

  def update
    @foods_nutrition = FoodsNutrition.find(params[:id])

    @foods_nutrition.foods_id = params[:foods_id]
    @foods_nutrition.foodscatagory_id = params[:foodscatagory_id]
    @foods_nutrition.foods_calories = params[:foods_calories]
    @foods_nutrition.foods_carbs = params[:foods_carbs]
    @foods_nutrition.foods_fat = params[:foods_fat]
    @foods_nutrition.foods_sugar = params[:foods_sugar]

    save_status = @foods_nutrition.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods_nutritions/#{@foods_nutrition.id}/edit", "/update_foods_nutrition"
        redirect_to("/foods_nutritions/#{@foods_nutrition.id}", :notice => "Foods nutrition updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Foods nutrition updated successfully.")
      end
    else
      render("foods_nutritions/edit.html.erb")
    end
  end

  def destroy
    @foods_nutrition = FoodsNutrition.find(params[:id])

    @foods_nutrition.destroy

    if URI(request.referer).path == "/foods_nutritions/#{@foods_nutrition.id}"
      redirect_to("/", :notice => "Foods nutrition deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Foods nutrition deleted.")
    end
  end
end
