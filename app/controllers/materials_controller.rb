class MaterialsController < ApplicationController

  def index
    @material = Material.all
    @material = Material.order("name DESC")
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to new_material_path
    else
      render :new
    end
  end

  private

  def material_params
    params.require(:material).permit(:name)
  end
end
