random_names = Faker::Name

default_user_image = "http://lorempixel.com/400/200"
default_band_image = "http://lorempixel.com/400/200"

Instrument.destroy_all
Genre.destroy_all
Musician.destroy_all
Band.destroy_all
BandGenre.destroy_all
InstrumentMusician.destroy_all
GenreMusician.destroy_all
Band.destroy_all
Opening.destroy_all
Request.destroy_all

instruments = ["Accordion", "Bagpipes", "Banjo", "Bass guitar", "Bassoon", "Berimbau", "Bongo", "Cello", "Clarinet", "Cor anglais", "Cornet", "Cymbal", "Didgeridoo", "Double bass", "Drum kit", "Euphonium", "Flute", "French horn", "Glass harmonica", "Glockenspiel", "Gong", "Guitar", "Harmonica", "Harp", "Harpsichord", "Hammered dulcimer", "Hurdy gurdy", "Jew’s harp", "Kalimba", "Lute", "Lyre", "Mandolin", "Marimba", "Melodica", "Oboe", "Ocarina", "Octobass", "Organ", "Pan Pipes", "Pennywhistle", "Piano", "Piccolo", "Recorder", "Saxophone", "Sitar", "Synthesizer", "Tambourine", "Timpani", "Triangle", "Trombone", "Trumpet", "Theremin", "Tuba", "Ukulele", "Viola", "Violin", "Whamola", "Xylophone", "Zither"]

genres = ["Blues", "Classical", "Country", "Electronic", "Folk", "Jazz", "New Age", "Reggae", "Rock", "Speed Funk", "Classical Dubstep"]

bands = ["Duke Lucius and the Flatiron Singers", "Pregnancy Sink", "Righteous Ruby", "Rails Infidelity", "Bad Rails", "SQL Orgy", "rake db:migraine", "Abuser.all" ]

availabilities = ["single gigs", "jams", "full-time band", "part-time band", "session_work"]

# Create Instruments
instruments.each {|instrument| Instrument.create(name: instrument)}
# Create Genres
genres.each {|genre| Genre.create(name: genre)}

# Create Musician
50.times do
  Musician.create(name: random_names.name,
    bio: Faker::Lorem.paragraph,
    availabiity: availabilities.sample,
    image_url: default_user_image,
    location: Faker::Address.city)
end
# Create Bands
bands.each {|band_name| Band.create(name: band_name,
                    musician_id: Musician.all.sample.id,
                    image_url: default_band_image,
                    status: availabilities.sample,
                    link: Faker::Internet.url
                    )}
# Give bands a genre
Band.all.each {|band| band.genres << Genre.all.sample(3)}
# Give musicians a genre and an instrument
Musician.all.each do |musician|
   musician.genres << Genre.all.sample(3)
   musician.instruments << Instrument.all.sample(3)
 end


# Create Openings
10.times do
  opening = Opening.new
  opening.band = Band.all.sample
  opening.instrument = Instrument.all.sample
  opening.commitment = availabilities.sample
  opening.description = Faker::Lorem.paragraph
  opening.save
end

# Create Requests
5.times do
  statuses = ["accepted", "declined", "pending"]
  opening = Opening.all.sample
  musician = Musician.all.sample
  request = Request.new
  request.musician = musician
  request.opening = opening
  request.musician_status = statuses.sample
  request.band_status = statuses.sample
  request.message = Faker::Lorem.paragraph
  request.save
end
