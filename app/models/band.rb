class Band < ApplicationRecord
  has_many :band_genres
  has_many :genres, through: :band_genres
  belongs_to :musician
  has_many :openings

  accepts_nested_attributes_for :genres

  validates :location, presence: true
  validates :name, presence: true
  validates :genres, length: {minimum: 1}
  validates :name, uniqueness: {scope: :musician_id, message: "This User Already Has a Band of that Name"}

  def user
    if (self.musician)
      return self.musician.user
    else
      return nil
    end
  end

  def self.sanitize_bands
    orphans = Band.all.select do |b|
      Musician.find_by(id: b.musician_id) == nil
    end.each do |orphan|
      Band.destroy(orphan.id)
    end
  end
end
