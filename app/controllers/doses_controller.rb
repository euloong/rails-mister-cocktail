class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to @dose.cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to @dose.cocktail
  end
  
  def edit
    @dose = Dose.find(params[:id])
  end
  
  def update
  @dose = Dose.find(params[:id])
  @dose.update(description: params[:dose][:description], ingredient_id: params[:dose][:ingredient_id])
  redirect_to @dose.cocktail
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
