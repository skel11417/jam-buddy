class Opening < ApplicationRecord
  belongs_to :band
  belongs_to :instrument
  has_many :requests
  has_many :musicians, through: :requests

  def manager
    if (self.band)
      return self.band.manager
    else
      return nil
    end
  end
end
