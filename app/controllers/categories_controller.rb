class CategoriesController < ApplicationController
  before_action :find_race, only: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  before_action :ensure_author, only: [:edit, :update, :destroy]

  def index
    @categories = @race.categories
  end

  def new
    @category = Category.new
    @category.race = @race
  end

  def create
    @category = Category.new(category_params)
    @category.race = @race
    if @category.save
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
    if @category.update_attributes(category_params)
      redirect_to category_path(@category)
    else
      render "edit"
    end
  end

  def destroy
    @category.destroy
    redirect_to race_path(@race)
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end

  def find_race
    @race = Race.find(params[:race_id])
    @competition = @race.competition
  end
  
  def find_category
    @category = Category.find(params[:id])
    @race = @category.race
    @competition = @race.competition
  end
end
