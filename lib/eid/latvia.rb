# frozen_string_literal: true

module Eid
  class Latvia < Core
    # NOTE: identity DDMMYY-XNNNZ
    # DDMYY - date of birth
    # X - century
    # NNN - birth serial number
    # Z - checksum digit
    #
    # 32XXXX-XXXXC (updated format since 01.07.2017)
    # 32 - updated format indicator
    # XXXX-XXXX - random numbers
    # C - checksum

    def legacy?
      !identity.start_with?('32')
    end

    def valid?
      legacy? ? (valid_format? && birth_date.is_a?(Date)) : valid_format?
    end

    def female?
      raise 'Not supported'
    end

    def male?
      raise 'Not supported'
    end

    def gender
      raise 'Not supported'
    end

    def birth_date
      Date.new(century + identity[4..5].to_i, identity[2..3].to_i, identity[0..1].to_i) if legacy?
    rescue StandardError
      nil
    end

    private

    def valid_format?
      identity.match?(/\d{6}-\d{5}/) && identity.size == 12
    end

    def century
      case identity[7].to_i
      when 1 then 1900
      when 2 then 2000
      else 2100
      end
    end
  end
end
