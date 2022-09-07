class HomeController < ApplicationController
  def index
    @workouts = Workout.all.order(id: :desc).limit(50)
  end
end
