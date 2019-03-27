class User < ApplicationRecord
  has_one :musician
  has_secure_password

  def first_name
    name = self.musician.name
    return name.split(" ")[0]
  end
end
