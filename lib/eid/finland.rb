# frozen_string_literal: true

module Eid
  class Finland < Core
    # NOTE: identity DDMMYYCZZZQ
    # DDMMYY - date of birth
    # C - century sign (+, -, U, V, W, X, Y, A, B, C, D, E, F)
    # ZZZ - individual number (002-899 for permanent residents and Finnish citizens, 900-999 for temporary IDs)
    # Q - control character (checksum)

    VALID_CENTURY_SIGNS = %w[+ - U V W X Y A B C D E F].freeze
    VALID_CONTROL_CHARACTERS = '0123456789ABCDEFHJKLMNPRSTUVWXY'

    def valid?
      return false unless identity.size == 11

      birth_date.is_a?(Date) &&
        VALID_CENTURY_SIGNS.include?(identity[6]) &&
        VALID_CONTROL_CHARACTERS.include?(identity[10])
    end

    def female?
      identity[7..9].to_i.even?
    end

    def male?
      identity[7..9].to_i.odd?
    end

    def birth_date
      Date.new(century + identity[4..5].to_i, identity[2..3].to_i, identity[0..1].to_i)
    rescue StandardError
      nil
    end

    private

    def valid_format?
      identity.size == 11
    end

    def century
      case identity[6]
      when '+' then 1800
      when '-', 'U', 'V', 'W', 'X', 'Y' then 1900
      when 'A', 'B', 'C', 'D', 'E', 'F' then 2000
      else 2100
      end
    end
  end
end
