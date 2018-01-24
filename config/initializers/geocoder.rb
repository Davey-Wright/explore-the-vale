Geocoder.configure(

	# to use an API key:
  api_key: ENV['GEOCODER_API_KEY'],

  # geocoding service (see below for supported options):
  lookup: :google,

)