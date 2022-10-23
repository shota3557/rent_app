class NearStation < ApplicationRecord
  belongs_to :property, inverse_of: :near_stations
end
