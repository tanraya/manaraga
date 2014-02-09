# Нужны разные декораторы для index и show. Этот - для index
module Manaraga
  module Decorator
    module AttributeFormatter
      protected

      def attribute_format(attribute)
        value = object.send(attribute)

        if attribute == :id
          return h.link_to value.to_s, h.resource_path(object)
        end

        case value
        when TrueClass, FalseClass
          I18n.t("simple_form.#{value ? 'yes' : 'no'}")
        when NilClass
          h.raw('&mdash;')
        when Date, Time, DateTime, ActiveSupport::TimeWithZone
          h.content_tag :time, I18n.l(value, format: :short)
        when Float, BigDecimal
          h.number_to_currency(value, precision: 0)
        when Integer
          value.to_s
        else
          if association = resource_class.reflect_on_association(attribute)
            # FIX: It will not work for 3 level resource
            h.link_to value, h.polymorphic_path(object.send(association.name))
          # Array
          elsif value.respond_to?(:join)
            value.join(', ')
          elsif value.to_s.empty?
            h.raw('&mdash;')
          else # String
            value.to_s
          end
        end
      end

      #def strip(str, word_limit = 20, length_limit = 50)
      #  str = str.split(/(\S{#{word_limit}})/)
      #           .join('&#8203;')
      #           .gsub(/\s+/, ' ')

      #  str = str.match(/.{#{length_limit}}/)[0] + "&hellip;" if str.mb_chars.size > length_limit
      #  h.raw(h.strip_tags(str))
      #end
    end
  end
end
