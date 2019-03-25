class Musician < ApplicationRecord
  has_many :instrument_musicians
  has_many :instruments, through: :instrument_musicians
end
