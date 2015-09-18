class RacesController < ApplicationController
  before_action :find_competition_by_id, only: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_race, only: [:show, :edit, :update, :destroy]
  before_action :ensure_author, only: [:edit, :update, :destroy]

  def index
    @races = @competition.races
  end

  def show
  end

  def new
    @race = Race.new
    @race.competition = @competition
  end

  def create
    @race = Race.new(race_params)
    @race.competition = @competition
    if @race.save
      redirect_to competition_path(@competition)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @race.update_attributes(race_params)
      redirect_to race_path(@race)
    else
      render 'edit'
    end
  end

  def destroy
    @race.destroy
    redirect_to competition_path(@competition)
  end

  private

  def race_params
    params.require(:race).permit(:title, :description, :discipline, :begin_date, :end_date, :place)
  end

  def find_competition_by_id
    @competition = Competition.find(params[:competition_id])
  end
  
  def find_race
    @race = Race.find(params[:id])
    @competition = @race.competition
  end
end
