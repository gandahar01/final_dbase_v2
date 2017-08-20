class FoodsCatagoriesController < ApplicationController
  def index
    @foods_catagories = FoodsCatagory.all

    render("foods_catagories/index.html.erb")
  end

  def show
    @user_cheat_allowance = UserCheatAllowance.new
    @foods_nutrition = FoodsNutrition.new
    @foods_catagory = FoodsCatagory.find(params[:id])

    render("foods_catagories/show.html.erb")
  end

  def new
    @foods_catagory = FoodsCatagory.new

    render("foods_catagories/new.html.erb")
  end

  def create
    @foods_catagory = FoodsCatagory.new

    @foods_catagory.foodcatagory_name = params[:foodcatagory_name]

    save_status = @foods_catagory.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods_catagories/new", "/create_foods_catagory"
        redirect_to("/foods_catagories")
      else
        redirect_back(:fallback_location => "/", :notice => "Foods catagory created successfully.")
      end
    else
      render("foods_catagories/new.html.erb")
    end
  end

  def edit
    @foods_catagory = FoodsCatagory.find(params[:id])

    render("foods_catagories/edit.html.erb")
  end

  def update
    @foods_catagory = FoodsCatagory.find(params[:id])

    @foods_catagory.foodcatagory_name = params[:foodcatagory_name]

    save_status = @foods_catagory.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods_catagories/#{@foods_catagory.id}/edit", "/update_foods_catagory"
        redirect_to("/foods_catagories/#{@foods_catagory.id}", :notice => "Foods catagory updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Foods catagory updated successfully.")
      end
    else
      render("foods_catagories/edit.html.erb")
    end
  end

  def destroy
    @foods_catagory = FoodsCatagory.find(params[:id])

    @foods_catagory.destroy

    if URI(request.referer).path == "/foods_catagories/#{@foods_catagory.id}"
      redirect_to("/", :notice => "Foods catagory deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Foods catagory deleted.")
    end
  end
end
