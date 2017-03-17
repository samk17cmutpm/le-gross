require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LeGross
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }
    config.action_controller.perform_caching = true

    config.assets.paths << Rails.root.join('vendor', 'assets')
    # fonts
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    # images
    config.assets.precompile << /\.(?:png|jpg)$/
    # precompile vendor assets
    config.assets.precompile += %w( base.js )
    config.assets.precompile += %w( base.css )
    config.assets.precompile += %w( ie6.css ie7.css )
    # precompile themes
    config.assets.precompile += ['angle/themes/theme-a.css',
                                 'angle/themes/theme-b.css',
                                 'angle/themes/theme-c.css',
                                 'angle/themes/theme-d.css',
                                 'angle/themes/theme-e.css',
                                 'angle/themes/theme-f.css',
                                 'angle/themes/theme-g.css',
                                 'angle/themes/theme-h.css'
                                ]
    # Controller assets
    config.assets.precompile += [
                                 # Scripts
                                 'charts.js',
                                 'dashboard.js',
                                 'documentation.js',
                                 'elements.js',
                                 'extras.js',
                                 'forms.js',
                                 'maps.js',
                                 'multilevel.js',
                                 'pages.js',
                                 'tables.js',
                                 'widgets.js',
                                 'blog.js',
                                 'ecommerce.js',
                                 'forum.js',
                                 # Stylesheets
                                 'charts.css',
                                 'dashboard.css',
                                 'documentation.css',
                                 'elements.css',
                                 'extras.css',
                                 'forms.css',
                                 'maps.css',
                                 'multilevel.css',
                                 'pages.css',
                                 'tables.css',
                                 'widgets.css',
                                 'blog.css',
                                 'ecommerce.css',
                                 'forum.css'
                                ]

    config.assets.precompile += [
                                # Orders Controller
                                'orders.js',
                                'orders.css',
                                'custom/orders/create_new_orders.js',
                                # Repositories Controller
                                'repositories.js',
                                'repositories.css',
                                # Imports Controller
                                'imports.js',
                                'imports.css',
                                'custom/imports/create_new_imports.js',
                                # Products Controller
                                'products.js',
                                'products.css',
                                'custom/products/products_new.js',
                                'custom/products/products_edit.js',
                                # Packs Controller
                                'packs.js',
                                'packs.css',
                                'custom/packs/create_new_packs.js',
                                # Customers Controller
                                'customers.js',
                                'customers.css',
                                'custom/customers/customers_edit.js',
                                'custom/customers/customers_new.js',
                                'fakes.js',
                                'fakes.css',
                                'custom/fakes/create_new_fakes.js',
                                # Deliveries Controller
                                'deliveries.js',
                                'deliveries.css',
                                'pays.js',
                                'pays.css',
                                # Dashboards Controller
                                'dashboards.js',
                                'dashboards.css'
                                ]
  end
end
