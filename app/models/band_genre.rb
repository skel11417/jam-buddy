class BandGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :band
end
