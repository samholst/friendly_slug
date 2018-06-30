module FriendlySlug
  module ActiveRecord
    module Base
      def build_friendly_slug(*attribute_list, use: nil)
        instance_variable_set("@_attribute_list", attribute_list)
        instance_variable_set("@_use_key", use)

        instance_eval do
          def _attribute_list
            @_attribute_list
          end

          _attribute_list.each do |attribute|
            define_singleton_method :"_friendly_#{attribute.to_s}_key" do
              instance_variable_set("@_friendly_#{attribute.to_s}_key", attribute)
            end
          end

          def _use_key
            @_use_key
          end

          def find_slugged(id)
            find(id.split("-").send(_use_key))
          end
        end

        class_eval do
          def to_param
            self.class._attribute_list.map do |attribute|
              lookup_key(self.class.send("_friendly_#{attribute.to_s}_key")).to_s
            end.join("-").gsub(/<\/?[^>]*>|[^\w\s-]/, '').strip.downcase.gsub(/\s{1,}/, '-')
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
