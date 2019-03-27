class User < ApplicationRecord
  has_one :musician
  has_secure_password

  def musician_attributes=(input)
    musician = Musician.new(
      name: input[:name],
      image_url: '/assets/default_musician',
      location: input[:location],
      availabiity: input[:availabiity]
    )
    musician.instruments << Instrument.find(input[:instrument_ids])
    musician.genres << Genre.find(input[:genre_ids])
    self.musician = musician
    musician.save
  end

  def first_name
    name = self.musician.name
    return name.split(" ")[0]
  end
end
