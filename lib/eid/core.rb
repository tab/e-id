# frozen_string_literal: true

require 'date'

module Eid
  class Core
    attr_accessor :identity

    def initialize(identity)
      @identity = identity.to_s
    end

    def gender
      female? ? :female : :male
    end

    def age
      Date.today.year - birth_date&.year.to_i
    end
  end
end
