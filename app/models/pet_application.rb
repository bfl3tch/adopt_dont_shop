class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  def self.find_pet_app(pet_id, application_id)
    pet_app = where("pet_id = #{pet_id} and application_id = #{application_id}")
    pet_app.first
  end
  # 
  # def potential_pets
  #   pets.uniq
  # end

end
