class UserCheatAllowancesController < ApplicationController
  before_action :current_user_must_be_user_cheat_allowance_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_user_cheat_allowance_user
    user_cheat_allowance = UserCheatAllowance.find(params[:id])

    unless current_user == user_cheat_allowance.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.user_cheat_allowances.ransack(params[:q])
      @user_cheat_allowances = @q.result(:distinct => true).includes(:user, :foodscatagory).page(params[:page]).per(10)

    render("user_cheat_allowances/index.html.erb")
  end

  def show
    @user_cheat_allowance = UserCheatAllowance.find(params[:id])

    render("user_cheat_allowances/show.html.erb")
  end

  def new
    @user_cheat_allowance = UserCheatAllowance.new

    render("user_cheat_allowances/new.html.erb")
  end

  def create
    @user_cheat_allowance = UserCheatAllowance.new

    @user_cheat_allowance.cheat_calories = params[:cheat_calories]
    @user_cheat_allowance.cheat_carbs = params[:cheat_carbs]
    @user_cheat_allowance.cheat_fat = params[:cheat_fat]
    @user_cheat_allowance.cheat_sugar = params[:cheat_sugar]
    @user_cheat_allowance.week_date = params[:week_date]
    @user_cheat_allowance.user_id = params[:user_id]
    @user_cheat_allowance.foodscatagory_id = params[:foodscatagory_id]

    save_status = @user_cheat_allowance.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_cheat_allowances/new", "/create_user_cheat_allowance"
        redirect_to("/user_cheat_allowances")
      else
        redirect_back(:fallback_location => "/", :notice => "User cheat allowance created successfully.")
      end
    else
      render("user_cheat_allowances/new.html.erb")
    end
  end

  def edit
    @user_cheat_allowance = UserCheatAllowance.find(params[:id])

    render("user_cheat_allowances/edit.html.erb")
  end

  def update
    @user_cheat_allowance = UserCheatAllowance.find(params[:id])

    @user_cheat_allowance.cheat_calories = params[:cheat_calories]
    @user_cheat_allowance.cheat_carbs = params[:cheat_carbs]
    @user_cheat_allowance.cheat_fat = params[:cheat_fat]
    @user_cheat_allowance.cheat_sugar = params[:cheat_sugar]
    @user_cheat_allowance.week_date = params[:week_date]
    @user_cheat_allowance.user_id = params[:user_id]
    @user_cheat_allowance.foodscatagory_id = params[:foodscatagory_id]

    save_status = @user_cheat_allowance.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_cheat_allowances/#{@user_cheat_allowance.id}/edit", "/update_user_cheat_allowance"
        redirect_to("/user_cheat_allowances/#{@user_cheat_allowance.id}", :notice => "User cheat allowance updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "User cheat allowance updated successfully.")
      end
    else
      render("user_cheat_allowances/edit.html.erb")
    end
  end

  def destroy
    @user_cheat_allowance = UserCheatAllowance.find(params[:id])

    @user_cheat_allowance.destroy

    if URI(request.referer).path == "/user_cheat_allowances/#{@user_cheat_allowance.id}"
      redirect_to("/", :notice => "User cheat allowance deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "User cheat allowance deleted.")
    end
  end
end
