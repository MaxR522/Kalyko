class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    if params["search"]
      @filter = params["search"]["tags"].flatten.reject(&:blank?)
      @recipe = @filter.empty? ? Recipe.all : Recipe.all.tagged_with(@filter, any: true)
    else
      @recipe = Recipe.all
    end
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

  # def tagged
  #   if params[:tag].present?
  #     @recipe = Recipe.tagged_with(params[:tag])
  #   else
  #     @recipe = Recipe.all
  #   end
  # end


  private

	def recipe_params
		params.require(:recipe).permit(:title, :time, :person_number, :main_image, :tag_list, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end
end
