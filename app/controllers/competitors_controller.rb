class CompetitorsController < ApplicationController
  before_action :find_race, only: [:index, :new, :create]
  before_action :find_competitor, only: [:show, :edit, :update, :destroy]
  before_action :ensure_author, only: [:edit, :update, :destroy]

  def index
    @competitors = @race.competitors
  end

  def new
    @competitor = Competitor.new
    @competitor.race = @race
  end

  def create
    @competitor = Competitor.new(competitor_params)
    @competitor.race = @race
    if @competitor.save
      redirect_to race_competitors_path(@race)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @competitor.update_attributes(competitor_params)
      redirect_to competitor_path(@competitor)
    else
      render 'edit'
    end
  end

  def destroy
    @competitor.destroy
    redirect_to race_path(@race)
  end

  private

  def competitor_params
    params.require(:competitor).permit(:name, :surname, :category_id, :birthday, :qualification, :trainer)
  end

  def find_race
    @race = Race.find(params[:race_id])
    @competition = @race.competition
  end
  
  def find_competitor
    @competitor = Competitor.find(params[:id])
    @race = @competitor.race
    @competition = @race.competition
  end
end
