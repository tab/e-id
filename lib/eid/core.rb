# frozen_string_literal: true

module Eid
  class Core
    attr_accessor :identity

    def initialize(identity)
      @identity = identity.to_s
    end
  end
end
