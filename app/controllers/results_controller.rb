class ResultsController < ApplicationController
  before_action :find_race, only: [:index, :new, :create, :set_result]
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
      redirect_to race_results_path(@race)
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
      redirect_to race_results_path(@race)
    else
      render "edit"
    end
  end

  def destroy
    @result.destroy
    redirect_to race_results_path(@race)
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

  def set_result
    time_now = Time.now
    @answers = params[:answer].strip.split(",")
    @answers.each do |answer|
      @result = @race.results.find_by(start_number: answer.strip.to_i)
      if @result
        if not @result.start_at
          @result.start_at = time_now
          @result.save!
        else
          if not @result.finish_at
            @result.finish_at = time_now
            @result.save!
          end
        end
      end
    end 
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
