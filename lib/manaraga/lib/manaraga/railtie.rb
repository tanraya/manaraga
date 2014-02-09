require 'rails/railtie'

module Manaraga
  # Railtie initializer for Rails 3.x and higher.
  class Railtie < Rails::Railtie
    initializer 'manaraga.add_view_paths', after: :add_view_paths do |app|
      ActiveSupport.on_load(:action_controller) do
        prepend_view_path app.root.join("app/views").to_s
      end
    end
  end
end
