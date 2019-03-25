class Musician < ApplicationRecord
  has_many :instrument_musicians
  has_many :instruments, through: :instrument_musicians
  has_many :genre_musicians
  has_many :genres, through: :genre_musicians
  has_many :bands
end
