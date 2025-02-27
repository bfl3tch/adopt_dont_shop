class Application < ApplicationRecord
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: true
  validates :application_status, presence: true

  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications, dependent: :destroy

  def pet_application_status(pet_id)
    pet_applications.find_by(pet_id: pet_id).status
  end
  #
  # def potential_pets
  #   pets.uniq
  # end
end
