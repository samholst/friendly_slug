module FriendlySlug
  module ActiveRecord
    module Base
      def build_friendly_slug(*attribute_list, use: nil)
        instance_variable_set("@_friendly_attribute_list", attribute_list)
        instance_variable_set("@_friendly_use_key", use)

        instance_eval do
          def _friendly_attribute_list
            @_friendly_attribute_list
          end

          _friendly_attribute_list.each do |attribute|
            define_singleton_method :"_friendly_#{attribute.to_s}_key" do
              instance_variable_set("@_friendly_#{attribute.to_s}_key", attribute)
            end
          end

          def _friendly_use_key
            @_friendly_use_key
          end

          def find_slugged(id)
            find(id.split("-").send(_friendly_use_key))
          end
        end

        class_eval do
          before_save :_update_slug
          validates_uniqueness_of :slug if self.class.respond_to?(:slug)

          def to_param
            self.class._friendly_attribute_list.map do |attribute|
              _lookup_key(self.class.send("_friendly_#{attribute.to_s}_key")).to_s
            end.join("-").gsub(/<\/?[^>]*>|[^\w\s-]/, '').strip.downcase.gsub(/\s{1,}/, '-')
          end

          private 
          def _lookup_key(k)
            k.is_a?(Symbol)? self.send(k) : k.to_s 
          end

          def _update_slug
            self.slug = self.to_param if self.class._friendly_use_key == :database
          end
        end
      end
    end
  end
end

class ActiveRecord::Base
  extend FriendlySlug::ActiveRecord::Base
end
