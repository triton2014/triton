# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Triton::Application.config.secret_key_base = '9dbd612ae6b3c45cfa32148bb076598f8fd4020ac413f97af5a8546316f6f9664380f8d86fbefc82ff51f7ad659f96656d6820e0df4f916da3f1390c8c4c8adf'
