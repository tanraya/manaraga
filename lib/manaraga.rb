require 'ostruct'
require 'inherited_resources'
require 'has_scope'
require 'draper'
require 'kaminari'
require 'simple_form'

module Manaraga
  autoload :DSL,           'manaraga/dsl'
  autoload :Configuration, 'manaraga/configuration'
  autoload :Decorator,     'manaraga/decorator'
end
