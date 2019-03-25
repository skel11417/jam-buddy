class Instrument < ApplicationRecord
  has_many :instrument_musicians
  has_many :muscians, through: :instrument_musicians
end
