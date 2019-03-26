TODO

<!-- - Model for Request -->
- Model/Controller for Opening
- erbs for all (ignoring genre and instrument)
- seed data for testing CRUD
  - genres
  - bands
  - musicians
  - instruments
  - instrument_musicians
  - band_genres
  - genre_musicians
  -
- integrate genre and instrument in forms (accepts_nested_attributes_for)

- After Basic Crud --
- User session
- Login functionality
- Filter indexes (indices?)
- Testing
- Validations

Opening:
  band_id
  role_id
  commmitment:string
  description:string

Band:
  musician_id
  name
  image_url
  status:string
  link

Request:
  musician_id
  opening_id
  message:string
  musician_status:boolean
  band_status:boolean
