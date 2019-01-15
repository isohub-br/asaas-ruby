require 'awesome_print'
require 'active_support'
require 'active_support/inflector'
require 'rest-client'
require 'typhoeus'
require 'dry-types'
require 'dry-struct'
require 'asaas/version'
require 'asaas/types'
require 'virtus'
require 'json'


module Asaas
  autoload :Entity, 'asaas/entity'
  autoload :Configuration, 'asaas/configuration'
  autoload :Api, 'asaas/api'
  autoload :Client, 'asaas/client'

  autoload :Customer, 'asaas/models/customer'
  autoload :Payment, 'asaas/models/payment'
  autoload :Discount, 'asaas/models/discount'
  autoload :Interest, 'asaas/models/interest'
  autoload :Fine, 'asaas/models/fine'

  class << self

    def setup(&block)
      Asaas::Configuration.setup(&block)
    end

  end


end
