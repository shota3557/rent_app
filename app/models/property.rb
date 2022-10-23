class Property < ApplicationRecord
  has_many :near_stations
  validates :name, :rent, :address, :year, :remarks, presence: true
end