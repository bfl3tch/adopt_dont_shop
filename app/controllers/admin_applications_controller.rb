class AdminApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    @new_pet = @potential_pets.find(id: params[:pet_id]).first
    @pet_application = PetApplication.find_pet_app(params[:pet_id], @application.id)

    render 'show'
  end
end
