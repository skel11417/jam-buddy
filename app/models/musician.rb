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
      self.instruments.sort.map { |instrument| instrument.name }.join(", ")
    else
      ""
    end
  end

  def has_instruments?
    self.instruments.any?
  end

  def managed_openings
    ret_array = []
    self.bands.each do |band|
      ret_array.concat(band.openings)
    end
    ret_array
  end

  def self.suggest(user_id) #suggest musicians who fit a user's openings
    suggested = []

    User.find(user_id).musician.bands.each do |band|
      location = band.location
      instruments = band.openings.map { |b| b.instrument }

      suggest = Musician.all.select do |musician|
        musician.user_id != user_id && musician.location == location && (musician.instruments & instruments).length > 0
      end
      suggested.concat(suggest)
    end
    return suggested
  end
end
