Hymnal.configure do |config|
  config.brand = "Hymnal"

  # Access Control
  #
  # Allow from all addresses
  #config.allow_acls << "0.0.0.0/0"

  # Allow from the local machine
  config.allow_acls << "127.0.0.1/32"

  # Allow from a local network
  config.allow_acls << "10.0.0.1/8"
  config.allow_acls << "192.0.0.1/8"

  # Message displayed when the user is blocked
  config.block_message = "We're sorry, but you are not allowed to access this application from your location."
end
