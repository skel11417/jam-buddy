class Genre < ApplicationRecord
  has_many :band_genres
  has_many :genre_musicians
  has_many :bands, through: :band_genres
  has_many :musicians, through: :genre_musicians
end
