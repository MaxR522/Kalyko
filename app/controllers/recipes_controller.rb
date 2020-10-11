class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipe = Recipe.all
  end

  def show
	end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create!(recipe_params)
    if @recipe.save
			redirect_to @recipe, notice: "Successfully created new recipe"
		else
			render 'new'
		end
  end



  private

	def recipe_params
		params.require(:recipe).permit(:title, :time, :person_number, :main_image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end
end
