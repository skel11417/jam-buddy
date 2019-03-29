class Opening < ApplicationRecord
  belongs_to :band
  belongs_to :instrument
  has_many :requests
  has_many :musicians, through: :requests

  validates :description, length: {minimum: 20}

  def user
    if (self.band)
      return self.band.user
    else
      return nil
    end
  end

  def name
    "#{self.band.name}: #{self.instrument.name}"
  end

  def self.suggest(user_id)
    suggested = []
    user_musician = User.find(user_id).musician
    #instrument match
    #location match
    #availability match
    location_match = self.all.select do |opening|
      user_musician.location == opening.band.location && user_id != opening.user.id
    end
    instrument_match = self.all.select do |opening|
      user_musician.instruments.include?(opening.instrument) && user_id != opening.user.id
    end
    best_match = location_match & instrument_match

    return best_match
  end
end
