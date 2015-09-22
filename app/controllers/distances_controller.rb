class DistancesController < ApplicationController
  before_action :find_race, only: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_distance, only: [:show, :edit, :update, :destroy]
  before_action :ensure_author, only: [:edit, :update, :destroy]

  def index
    @distances = @race.distances
  end

  def new
    @distance = Distance.new
    @distance.race = @race
  end

  def create
    @distance = Distance.new(distance_params)
    @distance.race = @race
    if @distance.save
      redirect_to race_path(@race)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @distance.update_attributes(distance_params)
      redirect_to distance_path(@distance)
    else
      render 'edit'
    end
  end

  def destroy
    @distance.destroy
    redirect_to race_path(@race)
  end

  private

  def distance_params
    params.require(:distance).permit(:title, :description, :distance_length, :cp_count)
  end

  def find_race
    @race = Race.find(params[:race_id])
    @competition = @race.competition
  end
  
  def find_distance
    @distance = Distance.find(params[:id])
    @race = @distance.race
    @competition = @race.competition
  end
end
