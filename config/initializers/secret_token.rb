# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Ikiez::Application.config.secret_key_base = 'bbd1e546c456a0f85446a23eaa8c216832526b5dc165392a302adab72907236185c1fc5bf1d2c82fbad241b1bdb0a64a54917c08d31161fb6bd8614bd15dfca0'


def secure_token
  token_file = Rails.root.join('.secret')
  if File.exists?(token_file)
    File.read(token_file).chomp 
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Ikiez::Application.config.secret_key_base = secure_token
