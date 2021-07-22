require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe 'relationships' do
    it { should belong_to(:pet) }
    it { should belong_to(:application) }
  end
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

  it 'can find a pet application' do
    expect(PetApplication.find_pet_app(@pet_1.id, @app_1.id)).to eq(@pet_app_1)
  end

  # it 'can find all the unique pets on an individual application' do
  #   expect(@pet_app_1.potential_pets).to eq(@pet_1)
  # end



end
