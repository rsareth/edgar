# Be sure to restart your server when you modify this file.

Edgar::Application.config.session_store :cookie_store, key: '_edgar_session', :domain => ENV["SESSION_DOMAIN"]

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Edgar::Application.config.session_store :active_record_store
