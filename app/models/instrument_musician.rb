class InstrumentMusician < ApplicationRecord
  belongs_to :instrument
  belongs_to :musician
end
