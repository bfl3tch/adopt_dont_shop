require 'rails_helper'

RSpec.describe 'the admin application index page' do
  before(:each) do
    @app_1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: 'kind')
    @app_2 = Application.create!(name: 'Ezze Alwfai', street: '1234 fake st', city: 'Lafayette', state: 'Colorado', zip_code: 80328, application_status: 'pending', description: 'rich')
    @app_3 = Application.create!(name: 'Marla Shulz', street: '2020 Corona st', city: 'Denver', state: 'Colorado', zip_code: 80218, application_status: 'approved', description: 'safe')
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)

    visit "/applications"
  end

  it 'lists all applications by name' do
    expect(page).to have_content(@app_1.name)
    expect(page).to have_content(@app_2.name)
    expect(page).to have_content(@app_3.name)
  end

  it 'displays a link to edit each pet' do
    expect(page).to have_link("Edit #{@app_1.name}")
    expect(page).to have_link("Edit #{@app_2.name}")

    click_link("Edit #{@app_1.name}")

    expect(current_path).to eq("/applications/#{@app_1.id}/edit")
  end

  it 'displays a link to delete each pet' do
    expect(page).to have_button("Delete #{@app_1.name}")
    expect(page).to have_button("Delete #{@app_2.name}")

    click_button("Delete #{@app_1.name}")

    expect(page).to have_current_path("/applications")
    expect(page).to_not have_content(@app_1.name)
    expect(page).to have_content(@app_2.name)
  end
end
