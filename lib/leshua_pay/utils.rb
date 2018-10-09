module LeshuaPay
  module Utils
    class << self
      def timestamp
        Time.now.to_i
      end

      def nonce_str
        SecureRandom.urlsafe_base64(nil, false)
      end
    end
  end
end
