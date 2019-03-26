class Musician < ApplicationRecord
  belongs_to :user
  has_many :instrument_musicians
  has_many :instruments, through: :instrument_musicians
  has_many :genre_musicians
  has_many :genres, through: :genre_musicians
  has_many :bands
  has_many :requests
  has_many :openings, through: :requests

  accepts_nested_attributes_for :genres, :instruments

  def print_instruments
    if has_instruments?
      self.instruments.map {|instrument| instrument.name}.join(", ")
    else
      ""
    end
  end

  def has_instruments?
    self.instruments.any?
  end
end
