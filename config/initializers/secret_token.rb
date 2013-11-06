# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Making use of a set (unsecure) key in environments that should only be run
# on localhost. For production, secret_key_base should be set as an
# environment variable for best security.
if Rails.env.development? || Rails.env.test?
  CurrencyConverter::Application.config.secret_key_base = 'a' * 30
else
  CurrencyConverter::Application.config.secret_key_base = ENV['SECRET_TOKEN']
end
