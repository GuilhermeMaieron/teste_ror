require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TesteRor
  class Application < Rails::Application

    config.middleware.use ActionDispatch::Flash
    config.autoload_paths += ['app/services']
    config.api_only = false
    config.active_record.raise_in_transactional_callbacks = true

  end
end
