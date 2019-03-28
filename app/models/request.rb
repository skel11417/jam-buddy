class Request < ApplicationRecord
  belongs_to :musician
  belongs_to :opening
  belongs_to :user
end
