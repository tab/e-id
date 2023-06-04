# frozen_string_literal: true

module Eid
  class Estonia < Core
    # NOTE: identity GYYMMDDSSSC
    # G – gender (even for female, odd for male)
    # YYMMDD – date of birth
    # SSS – serial number
    # C – checksum

    def valid?
      valid_format? && birth_date.is_a?(Date)
    end

    def female?
      identity[0].to_i.even?
    end

    def male?
      identity[0].to_i.odd?
    end

    def birth_date
      Date.new((century + identity[1..2].to_i), identity[3..4].to_i, identity[5..6].to_i)
    rescue StandardError
      nil
    end

    private

    def valid_format?
      identity.match?(/\d{11}/) && identity.size == 11
    end

    def century
      case identity[0].to_i
      when 1..2 then 1800
      when 3..4 then 1900
      when 5..6 then 2000
      else 2100
      end
    end
  end
end
