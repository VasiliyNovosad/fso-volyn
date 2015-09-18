class CompetitionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_competition, only: [:show, :edit, :update, :destroy]
  before_action :ensure_author, only: [:edit, :update, :destroy]

  def index
    @competitions = Competition.all
  end

  def show
  end

  def new
    @competition = Competition.new
    @competition.user = current_user
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.user = current_user
    if @competition.save
      redirect_to competitions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @competition.update_attributes(competition_params)
      redirect_to competition_path(@competition)
    else
      render "edit"
    end
  end

  def destroy
    @competition.destroy
    redirect_to 'index'
  end

  private

  def competition_params
    params.require(:competition).permit(:title, :description, :begin_date, :end_date, :bulletin)
  end

  def find_competition
    @competition = Competition.find(params[:id])
  end

end
