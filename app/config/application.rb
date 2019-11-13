
require_relative 'boot'

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Rapp5
  class Application < Rails::Application
    config.load_defaults 5.2

    #config.assets.unknown_asset_fallback = false
    #config.assets.debug = false

    config.records_dir = "/data/asterisk"

    config.assets.digest = true
    config.assets.css_compressor = :sass
    config.assets.js_compressor = :uglifier
    config.assets.gzip = true
  end

end

