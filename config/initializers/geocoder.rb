Geocoder.configure(
  # geocoding options
  # :timeout      => 3,           # geocoding service timeout (secs)
   :lookup       => :google,     # name of geocoding service (symbol)
  # :language     => :en,         # ISO-639 language code
  # :http_proxy   => nil,         # HTTP proxy server (user:pass@host:port)
  # :https_proxy  => nil,         # HTTPS proxy server (user:pass@host:port)
    :api_key      => ENV['GOOGLE_API_KEY'],        # API key for geocoding service
    :use_https    => true,       # use HTTPS for lookup requests? (if supported)
  # :cache        => nil,         # cache object (must respond to #[], #[]=, and #keys)
  # :cache_prefix => "geocoder:", # prefix (string) to use for all cache keys

  # exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and TimeoutError
  # :always_raise => [],

  # calculation options
    # :units     => :mi       # :km for kilometers or :mi for miles
  # :distances => :linear    # :spherical or :linear
  #:api_key => ENV['GEOCODER_API_KEY'], NEED TO SET UP ASAP (DONE SEE ABOVE)
  
)
