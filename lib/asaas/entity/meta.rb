module Asaas
  module Entity
    class Data < Virtus::Attribute
      def coerce(value)
        value.map do |hash|
          if hash.has_key? "object"
            entity = convert_data_to_entity(hash["object"])
            entity.new(hash)
          elsif hash.has_key?("interrupted") && hash.has_key?("enabled") # webhook implementation is different than others for some reason
            entity = convert_data_to_entity("webhook")
            entity.new(hash)
          else
            entity = convert_data_to_entity(hash.keys.first)
            entity.new(hash.values.first)
          end
        end
      end

      protected
      def convert_data_to_entity(type)
        if Asaas::Configuration.api_version == 2
          "Asaas::Entity::#{type.classify}".constantize
        else
          "Asaas::#{type.classify}".constantize
        end
      rescue
        Asaas::Entity::Base
      end
    end

    class Meta
      include Virtus.model

      attribute :limit, Integer
      attribute :offset, Integer
      attribute :hasMore, Axiom::Types::Boolean
      attribute :data, Data

    end
  end
end