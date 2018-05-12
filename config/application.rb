require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Restauranteur
  class Application < Rails::Application
    #config.time_zone              = 'Central Time (US & Canada)'
    config.i18n.load_path         += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [ :en, :fr ]
    config.i18n.default_locale    = :fr
  end
end
