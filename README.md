# LeshuaPay

A gem to deal with LeshuaPay. The LeshuaPay official document can be found [here](http://mch.weixin.qq.com/wiki/doc/api/index.html). You will receive the backend document when you get the LeshuaPay access.

## Installation

Add this line to your application's Gemfile:

    gem 'LeshuaPay', '~> 0.0.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install LeshuaPay

## Usage

### Configuration

```ruby
LeshuaPay.configure do |w|
  w.app_id = 'wx123456'
  w.mch_id = 'abcdefg'
  w.payment_key = 'abc123'
end
```  
  
The params contains:

- app_id: 公众账号ID
- mch_id: 微信商户账号
- payment_key: 商户支付秘钥

### Unified Order/统一下单
```ruby
options = {
  body: 'awesome product name'
  out_trade_no: '20150101030320204',
  total_fee: 100, # in cents
  spbill_create_ip: '127.0.0.1',
  notify_url: 'http://example.com/notify',
  trade_type: "JSAPI",
  openid: '123123123'
}
response = LeshuaPay::Service.unified_order(options)
prepay_id = response["prepay_id"]
```

### Refund/退款
```ruby
options = {
  out_trade_no: '20150101030320204',
  out_refund_no: '334443222222222',
  total_fee: 10000,
  refund_fee: 10000,
  refund_fee_type: 'CNY'
}
LeshuaPay::Service.refund(options, cert, cert_pwd)

```

### Generate payment params
```ruby
params = LeshuaPay::Service.pay_params(prepay_id)
# {
#    timestamp: 0, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
#   nonceStr: '', // 支付签名随机串，不长于 32 位
#   package: '', // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
#   signType: '', // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
#   paySign: '', // 支付签名
# }
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/LeshuaPay/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
