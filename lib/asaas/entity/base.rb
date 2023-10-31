module Asaas
  module Entity
    class Base
      include Virtus.model

      # permite definir atributos dinamicamente
      def initialize(attributes = {}, *args)
        self.extend(Virtus.model)
    
        attribute_set.merge(self.class.attribute_set)
    
        attributes.keys.each do |name|
          attribute(name) unless attribute_set[name] 
        end
    
        super
      end

      def empty?
        attributes.values.compact.empty?
      end
    end
  end
end