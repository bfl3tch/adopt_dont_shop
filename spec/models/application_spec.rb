require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many(:pet_applications) }
    it { should have_many(:pets).through(:pet_applications) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_numericality_of(:zip_code) }
  end

  describe 'instance methods' do
    before(:each) do
      @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

      @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: false)
      @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
      @pet_3 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 5, adoptable: true)

      @app_1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: 'kind')

      @pet_app_1 = PetApplication.create(pet_id: @pet_1.id, application_id: @app_1.id)
      @pet_app_2 = PetApplication.create(pet_id: @pet_2.id, application_id: @app_1.id)
      @pet_app_3 = PetApplication.create(pet_id: @pet_3.id, application_id: @app_1.id)
    end

    describe '#pet_application_status' do
      it 'returns all pet applications for a single application' do
        expect(@app_1.pet_application_status(@pet_1.id)).to eq('pending')
      end

      # it 'can find all the unique pets on an individual application' do
      #   expect(@app_1.potential_pets).to eq(@pet_1)
      # end
    end
  end
end
