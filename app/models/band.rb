class Band < ApplicationRecord
  has_many :band_genres
  has_many :genres, through: :band_genres
  belongs_to :musician
  has_many :openings
end
