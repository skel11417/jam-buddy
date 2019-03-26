class User < ApplicationRecord
  has_one :musician
  has_secure_password

end
