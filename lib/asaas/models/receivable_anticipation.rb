module Asaas
  class ReceivableAnticipation < Model
    attribute :id, Types::Coercible::String.optional.default(nil)
    attribute :installment, Types::Coercible::String.optional.default(nil)
    attribute :payment, Types::Coercible::String.optional.default(nil)
    attribute :status, Types::Coercible::String.optional.default(nil)
    attribute :anticipationDate, Types::Coercible::String.optional.default(nil)
    attribute :dueDate, Types::Coercible::String.optional.default(nil)
    attribute :requestDate, Types::Coercible::String.optional.default(nil)
    attribute :fee, Types::Coercible::Float.optional.default(nil)
    attribute :anticipationDays, Types::Coercible::String.optional.default(nil)
    attribute :netValue, Types::Coercible::Float.optional.default(nil)
    attribute :totalValue, Types::Coercible::Float.optional.default(nil)
    attribute :value, Types::Coercible::Float.optional.default(nil)
    attribute :denialObservation, Types::Coercible::String.optional.default(nil)
    attribute :isDocumentationRequired, Types::Coercible::String.optional.default(nil)
  end
end
