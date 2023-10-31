module Asaas
  class ReceivableAnticipation < Model
    attribute :id, Types::Coercible::String
    attribute :installment, Types::Coercible::String.optional.default(nil)
    attribute :payment, Types::Coercible::String.optional.default(nil)
    attribute :status, Types::Coercible::String
    attribute :anticipationDate, Types::Coercible::String
    attribute :dueDate, Types::Coercible::String
    attribute :requestDate, Types::Coercible::String
    attribute :fee, Types::Coercible::String
    attribute :anticipationDays, Types::Coercible::String
    attribute :netValue, Types::Coercible::String
    attribute :totalValue, Types::Coercible::String
    attribute :value, Types::Coercible::String
    attribute :denialObservation, Types::Coercible::String
  end
end
