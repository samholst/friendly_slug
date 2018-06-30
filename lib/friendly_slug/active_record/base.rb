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

          def to_param
            if self.respond_to?(:slug)
              if self.slug.nil? || self.send("#{self.class.send("_friendly_attribute_list").first.to_s}_changed?".to_sym)
                create_slug
              else
                self.slug
              end
            else
              create_slug
            end
          end

          private 
          def _lookup_key(k)
            k.is_a?(Symbol)? self.send(k) : k.to_s 
          end

          def _update_slug
            if self.class._friendly_use_key == :database
              unless self.class.where("slug = ? AND id != ?", self.to_param, self.id.nil? ? "NULL" : self.id).any? 
                self.slug = self.to_param 
              else
                self.slug = "#{self.to_param}" + SecureRandom.hex(6)
              end
            end
          end

          def create_slug
            self.class._friendly_attribute_list.map do |attribute|
              _lookup_key(self.class.send("_friendly_#{attribute.to_s}_key")).to_s
            end.join("-").gsub(/<\/?[^>]*>|[^\w\s-]/, '').strip.downcase.gsub(/\s{1,}/, '-')
          end
        end
      end
    end
  end
end

class ActiveRecord::Base
  extend FriendlySlug::ActiveRecord::Base
end
