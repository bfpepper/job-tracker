class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      flash[:notice] = "That category is already created."
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
