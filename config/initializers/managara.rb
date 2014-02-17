Manaraga.configure do |config|
  # Authorization
  config.user_class          = 'User'
  config.current_user_method = :current_user

  # Decorators
  config.decorator_class       = Manaraga::Decorator::DefaultDecorator
  config.index_decorator_class = Manaraga::Decorator::IndexDecorator
  config.decorate_resource_for = [:destroy, :create, :update]

  # Automatically translate foreign keys columns to associations
  # For example, `user_id` will be translated to `user`
  config.foreign_key_as_association = true
end
