=begin
  TODOS:

  - create mapping dsl to map attribute type to formatter
  - Add default order by id, if there no order
  - include_blank false for association input if association is required
    (model has validates :company, presence: true)
  - custom config for simple_form with bootstrap
  - translation helpers (or decorator methods) that translate table heading/attributes
    and other stuff
  - generators to create new controllers. Copy files generator.
  - custom Kaminari views
  - include simple-form-essentials gem
  !- detect automatically what actions we have. Pass this knowledge to inherited_resources
    actions method. Show/hide appropriate interface buttons and stuff.
  + try to use custom decorators (Вроде работает)
=end

require 'manaraga/engine'
require 'manaraga/dsl'
require 'ostruct'
require 'inherited_resources'
require 'draper'
require 'kaminari'
require 'has_scope'
require 'simple_form'

module Manaraga
  autoload :InheritedResources, 'manaraga/inherited_resources'
  autoload :Configuration,      'manaraga/configuration'
  autoload :Decorator,          'manaraga/decorator'
  autoload :Permissions,        'manaraga/permissions'

  # Global configuration
  mattr_accessor :configuration
  @@configuration = Configuration.new

  def self.configure(&block)
    yield self.configuration
  end
end

require 'manaraga/railtie'
