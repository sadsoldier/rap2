require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rapp5
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    #config.assets.unknown_asset_fallback = false
    #config.assets.debug = false
    config.assets.digest = true
    #config.assets.css_compressor = :yui
    config.assets.js_compressor = :uglifier
    config.assets.gzip = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

#ActiveRecord::SessionStore::Session.table_name = 'legacy_session_table'
#ActiveRecord::SessionStore::Session.primary_key = 'session_id'
#ActiveRecord::SessionStore::Session.data_column_name = 'legacy_session_data'
#ActiveRecord::SessionStore::Session.serializer = :json

