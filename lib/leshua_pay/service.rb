require 'active_support/core_ext/hash'
require 'httparty'

module LeshuaPay
  module Service

    class InvalidResponseError < StandardError; end

    class << self

      def scan_code_pay opt
        options = {
          merchant_id: Config.mch_id,
          nonce_str: SecureRandom.hex(16),
          service: 'get_tdcode',
          pay_way: 'WXZF',
          appid: Config.app_id,
          body: 'LeshuaPay',
          jspay_flag: 3,
        }

        ext_opt = opt.slice(
          :pay_way, :sub_openid, :jspay_flag, :third_order_id, :body, :client_ip, :amount, :notify_url,
           :callback_url, :goods_tag, :limit_pay, :shop_no, :pos_no, :attach, :app_id)

        options = options.merge ext_opt

        http_post(Config::LEPOS_PAY_GATEWAY_URL, Sign.signature(options))
      end

      def barcode_pay opt
        options = {
          merchant_id: Config.mch_id,
          nonce_str: SecureRandom.hex(16),
          service: 'upload_authcode',
          appid: Config.app_id,
          body: 'LeshuaPay',
        }

        ext_opt = opt.slice(
          :pay_way, :auth_code, :third_order_id, :body, :client_ip, :amount, :notify_url,
           :callback_url, :goods_tag, :limit_pay, :shop_no, :pos_no, :attach, :app_id)

        options = options.merge ext_opt
        http_post(Config::LEPOS_PAY_GATEWAY_URL, Sign.signature(options))
      end

      def query_order order_id
        options = {
          merchant_id: Config.mch_id,
          service: 'query_status',
          third_order_id: order_id,
          nonce_str: SecureRandom.hex(16),
        }

        http_post(Config::LEPOS_PAY_GATEWAY_URL, Sign.signature(options))
      end

      def refund opt
         options = {
          merchant_id: Config.mch_id,
          nonce_str: SecureRandom.hex(16),
          service: 'unified_refund',
        }

        ext_opt = opt.slice(:third_order_id, :leshua_order_id, :notify_url, :refund_amount, :merchant_refund_id, :leshua_refund_id)

        options = options.merge ext_opt

        http_post(Config::LEPOS_PAY_GATEWAY_URL, Sign.signature(options))
      end

      def unified_query_refund opt
         options = {
          merchant_id: Config.mch_id,
          nonce_str: SecureRandom.hex(16),
          service: 'unified_query_refund',
        }

        ext_opt = opt.slice(:third_order_id, :leshua_order_id, :merchant_refund_id, :leshua_refund_id)

        options = options.merge ext_opt

        http_post(Config::LEPOS_PAY_GATEWAY_URL, Sign.signature(options))
      end

      private

      def http_post url, body
        puts body
        response = HTTParty.post(
         url,
         body: body,
         headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
        )
        Hash.from_xml(response.body)
      end
    end
  end
end
