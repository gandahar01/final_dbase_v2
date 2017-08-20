class DailyWorkoutsController < ApplicationController
  def index
    @daily_workouts = DailyWorkout.page(params[:page]).per(10)

    render("daily_workouts/index.html.erb")
  end

  def show
    @daily_workout = DailyWorkout.find(params[:id])

    render("daily_workouts/show.html.erb")
  end

  def new
    @daily_workout = DailyWorkout.new

    render("daily_workouts/new.html.erb")
  end

  def create
    @daily_workout = DailyWorkout.new

    @daily_workout.workout_date = params[:workout_date]
    @daily_workout.dailyworkout_check = params[:dailyworkout_check]
    @daily_workout.user_id = params[:user_id]
    @daily_workout.weeklyworkout_id = params[:weeklyworkout_id]

    save_status = @daily_workout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/daily_workouts/new", "/create_daily_workout"
        redirect_to("/daily_workouts")
      else
        redirect_back(:fallback_location => "/", :notice => "Daily workout created successfully.")
      end
    else
      render("daily_workouts/new.html.erb")
    end
  end

  def edit
    @daily_workout = DailyWorkout.find(params[:id])

    render("daily_workouts/edit.html.erb")
  end

  def update
    @daily_workout = DailyWorkout.find(params[:id])

    @daily_workout.workout_date = params[:workout_date]
    @daily_workout.dailyworkout_check = params[:dailyworkout_check]
    @daily_workout.user_id = params[:user_id]
    @daily_workout.weeklyworkout_id = params[:weeklyworkout_id]

    save_status = @daily_workout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/daily_workouts/#{@daily_workout.id}/edit", "/update_daily_workout"
        redirect_to("/daily_workouts/#{@daily_workout.id}", :notice => "Daily workout updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Daily workout updated successfully.")
      end
    else
      render("daily_workouts/edit.html.erb")
    end
  end

  def destroy
    @daily_workout = DailyWorkout.find(params[:id])

    @daily_workout.destroy

    if URI(request.referer).path == "/daily_workouts/#{@daily_workout.id}"
      redirect_to("/", :notice => "Daily workout deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Daily workout deleted.")
    end
  end
end
