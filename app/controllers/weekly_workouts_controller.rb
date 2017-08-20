class WeeklyWorkoutsController < ApplicationController
  def index
    @weekly_workouts = WeeklyWorkout.page(params[:page]).per(10)

    render("weekly_workouts/index.html.erb")
  end

  def show
    @daily_workout = DailyWorkout.new
    @weekly_workout = WeeklyWorkout.find(params[:id])

    render("weekly_workouts/show.html.erb")
  end

  def new
    @weekly_workout = WeeklyWorkout.new

    render("weekly_workouts/new.html.erb")
  end

  def create
    @weekly_workout = WeeklyWorkout.new

    @weekly_workout.user_id = params[:user_id]
    @weekly_workout.daily_workout_counter = params[:daily_workout_counter]

    save_status = @weekly_workout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/weekly_workouts/new", "/create_weekly_workout"
        redirect_to("/weekly_workouts")
      else
        redirect_back(:fallback_location => "/", :notice => "Weekly workout created successfully.")
      end
    else
      render("weekly_workouts/new.html.erb")
    end
  end

  def edit
    @weekly_workout = WeeklyWorkout.find(params[:id])

    render("weekly_workouts/edit.html.erb")
  end

  def update
    @weekly_workout = WeeklyWorkout.find(params[:id])

    @weekly_workout.user_id = params[:user_id]
    @weekly_workout.daily_workout_counter = params[:daily_workout_counter]

    save_status = @weekly_workout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/weekly_workouts/#{@weekly_workout.id}/edit", "/update_weekly_workout"
        redirect_to("/weekly_workouts/#{@weekly_workout.id}", :notice => "Weekly workout updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Weekly workout updated successfully.")
      end
    else
      render("weekly_workouts/edit.html.erb")
    end
  end

  def destroy
    @weekly_workout = WeeklyWorkout.find(params[:id])

    @weekly_workout.destroy

    if URI(request.referer).path == "/weekly_workouts/#{@weekly_workout.id}"
      redirect_to("/", :notice => "Weekly workout deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Weekly workout deleted.")
    end
  end
end
