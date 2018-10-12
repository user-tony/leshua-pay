require 'active_support/core_ext/hash'
require 'httparty'

module LeshuaPay
  module Merchant
    class Base

      # 商户进件
      REGISTER_URL = 'http://pos.lepass.cn/api/merchant/register.do'

      # 商户开通业务
      OPEN_URL = 'http://pos.lepass.cn/api/merchant/open.do'

      # 商户信息修改 MA003
      UPDATE_URL = 'http://pos.lepass.cn/api/merchant/update.do'

      # 商户支付参数-新增 MA005
      WXPAYCONFIG_URL = 'http://pos.lepass.cn/api/wechat/wxpayconfig.do'

      # 商户支付参数-查询 MA006
      WXPAYCONFIG_QRY = 'http://pos.lepass.cn/api/wechat/wxpayconfig_qry.do'

      private

      def http_post url, body
        response = HTTParty.post(
         url,
         body: body,
         headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
        )
        Hash.from_xml(response.body)
      end

      def http_get url
        response = HTTParty.get(
         url,
         headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
        )
        Hash.from_xml(response.body)
      end
    end
  end
end
