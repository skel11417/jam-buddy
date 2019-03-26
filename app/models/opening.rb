class Opening < ApplicationRecord
  belongs_to :band
  belongs_to :instrument
  has_many :requests
  has_many :musicians, through: :requests
end
