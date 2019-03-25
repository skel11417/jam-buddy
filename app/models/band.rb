class Band < ApplicationRecord
  has_many :band_genres
  has_many :genres, through: :band_genres
  belongs_to :musician
end
