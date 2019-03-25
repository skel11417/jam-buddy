class GenreMusician < ApplicationRecord
  belongs_to :genre
  belongs_to :musician
end
