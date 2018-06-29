module FriendlySlug
  module ActiveRecord
    module Base
      def build_friendly_slug(first_attribute_key, second_attribute_key, key_position: nil)
        instance_variable_set("@first_attribute_key", first_attribute_key)
        instance_variable_set("@second_attribute_key", second_attribute_key)
        instance_variable_set("@key_position", key_position)

        instance_eval do
          def first_attribute_key
            @first_attribute_key
          end

          def second_attribute_key
            @second_attribute_key
          end

          def key_position
            @key_position
          end

          def find_slugged(id)
            find(id.split("-").send(key_position))
          end
        end

        class_eval do
          def to_param
            "#{lookup_key(self.class.first_attribute_key)}-#{lookup_key(self.class.second_attribute_key)}".to_s.gsub(/<\/?[^>]*>|[^\w\s-]/, '').strip.downcase.gsub(/\s{1,}/, '-')
          end

          private 
          def lookup_key(k)
            k.is_a?(Symbol)? self.send(k) : k.to_s 
          end
        end
      end
    end
  end
end

class ActiveRecord::Base
  extend FriendlySlug::ActiveRecord::Base
end

