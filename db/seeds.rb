
Instrument.destroy_all
Genre.destroy_all
instruments = ["Accordion", "Bagpipes", "Banjo", "Bass guitar", "Bassoon", "Berimbau", "Bongo", "Cello", "Clarinet", "Cor anglais", "Cornet", "Cymbal", "Didgeridoo", "Double bass", "Drum kit", "Euphonium", "Flute", "French horn", "Glass harmonica", "Glockenspiel", "Gong", "Guitar", "Harmonica", "Harp", "Harpsichord", "Hammered dulcimer", "Hurdy gurdy", "Jew’s harp", "Kalimba", "Lute", "Lyre", "Mandolin", "Marimba", "Melodica", "Oboe", "Ocarina", "Octobass", "Organ", "Pan Pipes", "Pennywhistle", "Piano", "Piccolo", "Recorder", "Saxophone", "Sitar", "Synthesizer", "Tambourine", "Timpani", "Triangle", "Trombone", "Trumpet", "Theremin", "Tuba", "Ukulele", "Viola", "Violin", "Whamola", "Xylophone", "Zither"]

genres = ["Blues", "Classical", "Country", "Electronic", "Folk", "Jazz", "New Age", "Reggae", "Rock", "Speed Funk", "Classical Dubstep"]

bands = ["Duke Lucius and the Flatiron Singers", "Pregnancy Sink", "Righteous Ruby", "Rails Infidelity", "Bad Rails", "SQL Orgy", ]

# Create Instruments
instruments.each {|instrument| Instrument.create(name: instrument)}
# Create Genres
genres.each {|genre| Genre.create(name: genre)}
# Create Bands
bands.each {|band| Band.create(name: band,
  )}
