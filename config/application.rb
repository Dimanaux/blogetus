require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blogetus
  class Application < Rails::Application
    config.load_defaults 5.1

    config.generators.system_tests = nil

    I18n.load_path += Dir[Rails.root.join("config", "locales", "**/*.{rb,yml}").to_s]

    config.action_mailer.default_options = { from: ENV.fetch("MAILER_SENDER_ADDRESS") }
    config.action_mailer.default_url_options = { host: ENV.fetch("HOST"), port: ENV.fetch("PORT") }
  end
end
