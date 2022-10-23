class Property < ApplicationRecord
  has_many :near_stations, dependent: :destroy, inverse_of: :property
  validates :name, :rent, :address, :year, :remarks, presence: true
  accepts_nested_attributes_for :near_stations, allow_destroy: true, reject_if: :all_blank
end