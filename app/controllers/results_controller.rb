class ResultsController < ApplicationController
  before_action :find_race, only: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_result, only: [:show, :edit, :update, :destroy, :start, :finish]
  before_action :ensure_author, only: [:new, :create, :edit, :update, :destroy]

  def index
    @results = @race.results
  end

  def new
    @result = Result.new
    @result.race = @race
  end

  def create
    @result = Result.new(result_params)
    @result.race = @race
    if @result.save
      redirect_to race_path(@race)
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @result.update_attributes(result_params)
      redirect_to result_path(@result)
    else
      render "edit"
    end
  end

  def destroy
    @result.destroy
    redirect_to race_path(@race)
  end

  def start
    @result.start_at = Time.now
    @result.save!
    render 'index'
  end

  def finish
    @result.finish_at = Time.now
    @result.save!
    render 'index'
  end

  private

  def result_params
    params.require(:result).permit(:start_number, :start_at, :finish_at, :state, :competitor_id)
  end

  def find_race
    @race = Race.find(params[:race_id])
    @competition = @race.competition
  end
  
  def find_result
    @result = Result.find(params[:id])
    @race = @result.race
    @competition = @race.competition
  end
end
