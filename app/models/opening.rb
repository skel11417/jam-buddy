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
end
