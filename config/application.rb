require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require 'carrierwave'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AllieroForms
  class Application < Rails::Application
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.initialize_on_precompile = true
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')

    config.autoload_paths += %W(#{config.root}/lib)

    config.action_dispatch.default_headers = {
          'X-Frame-Options' => 'ALLOWALL'
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = "nb"

    config.generators do |g|
      g.fixture_replacement :fabrication
      g.template_engine     :slim
      g.test_framework      :rspec,
        views: false,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
    end


    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               ENV['SMTP_DOMAIN'],
      user_name:            ENV['SMTP_USERNAME'],
      password:             ENV['SMTP_PASSWORD'],
      authentication:       'plain',
      enable_starttls_auto: true  
    }

    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]


  end
  default_url_options = { host: 'localhost', port: 3000 }
end
