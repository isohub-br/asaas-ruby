module Asaas
  class FinancialTransaction < Model
    attribute :id, Types::Coercible::String
    attribute :value, Types::Coercible::Float
    attribute :balance, Types::Coercible::Float
    attribute :type, Types::Coercible::String
    attribute :date, Types::Coercible::String
    attribute :description, Types::Coercible::String
    attribute :paymentId, Types::Coercible::String.optional.default(nil)
    attribute :transferId, Types::Coercible::String.optional.default(nil)
    attribute :anticipationId, Types::Coercible::String.optional.default(nil)
    attribute :billId, Types::Coercible::String.optional.default(nil)
    attribute :invoiceId, Types::Coercible::String.optional.default(nil)
    attribute :paymentDunningId, Types::Coercible::String.optional.default(nil)
    attribute :creditBureauReportId, Types::Coercible::String.optional.default(nil)
  end
end
