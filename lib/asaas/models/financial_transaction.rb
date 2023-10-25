module Asaas
  class FinancialTransaction < Model
    attribute :transform_keys(&,to_sym)
    
    attribute :id, Types::Coercible::String.optional.default(nil)
    attribute :value, Types::Coercible::String.optional.default(nil)
    attribute :balance, Types::Coercible::String.optional.default(nil)
    attribute :type, Types::Coercible::String.optional.default(nil)
    attribute :date, Types::Coercible::String.optional.default(nil)
    attribute :description, Types::Coercible::String.optional.default(nil)
    attribute :paymentId, Types::Coercible::String.optional.default(nil)
    attribute :transferId, Types::Coercible::String.optional.default(nil)
    attribute :anticipationId, Types::Coercible::String.optional.default(nil)
    attribute :billId, Types::Coercible::String.optional.default(nil)
    attribute :invoiceId, Types::Coercible::String.optional.default(nil)
    attribute :paymentDunningId, Types::Coercible::String.optional.default(nil),
    attribute :creditBureauReportId, Types::Coercible::String.optional.default(nil)
  end
end
