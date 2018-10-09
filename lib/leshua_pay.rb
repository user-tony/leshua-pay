require "leshua_pay/version"
require "leshua_pay/sign"
require "leshua_pay/utils"
require "leshua_pay/service"

module LeshuaPay

  class Config

    API_HOST = 'http://testlepos.yeahka.com:43102'
    LEPOS_PAY_GATEWAY_URL = API_HOST + '/cgi-bin/lepos_pay_gateway.cgi'

    class << self
      attr_accessor :app_id, :mch_id, :payment_key
    end

  end

  class << self
    def configure
      yield Config if block_given?
    end
  end

end
