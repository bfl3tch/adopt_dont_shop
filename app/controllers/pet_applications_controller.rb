class PetApplicationsController < ApplicationController
  def index
    @applications = Application.all
    @pets = Pet.all
  end

  def new
  end

  def create
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    @pet_application = PetApplication.create(pet: pet, application: application)
    application.pets << pet
    redirect_to "/applications/#{application.id}/?pet_id&#{params[:pet_id]}"
  end

  def update
    @application = Application.find(params[:application_id])
    @pet = Pet.find(params[:pet_id])
    @pet_application = PetApplication.where(pet: @pet, application: @application)
    @pet_application.update(status: params[:status])

    redirect_to "/admin/applications/#{@application.id}/"
  end

  def approved
    @application = Application.find(params[:application_id])
    @pet = Pet.find(params[:pet_id])
    @pet_application = PetApplication.where(pet: @pet, application: @application)
    @pet_application.update(status: 'approved')

    redirect_to "/admin/applications/#{@application.id}/"
  end

  def denied
    @application = Application.find(params[:application_id])
    @pet = Pet.find(params[:pet_id])
    @pet_application = PetApplication.where(pet: @pet, application: @application)
    @pet_application.update(status: 'denied')
    
    redirect_to "/admin/applications/#{@application.id}/"
  end
end
