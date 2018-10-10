# LeshuaPay

[![Build Status](https://travis-ci.org/user-tony/leshua-pay.svg?branch=master)](https://travis-ci.org/user-tony/leshua-pay)[![Inline docs](http://inch-ci.org/github/user-tony/leshua-pay.svg?branch=master)](http://inch-ci.org/github/user-tony/leshua-pay)


A gem to deal with LeshuaPay. The LeshuaPay official document can be found [here](https://www.yeahka.com/leshua_index.html). You will receive the backend document when you get the LeshuaPay access.

## Installation

Add this line to your application's Gemfile:

    gem 'leshua_pay', '~> 0.0.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install leshua_pay

## Usage 

 
### Configuration

```ruby
LeshuaPay.configure do |w|
  w.app_id = 'sdfadfasfd'
  w.mch_id = '0000000018'
  w.payment_key = 'a1613a0e7cb9d3a51e33784ee4d212ac'
end
```  
  
The params contains:

- app_id: 公众账号ID
- mch_id: 微信商户账号
- payment_key: 商户支付秘钥

### 扫码支付
```ruby
  options = {
    body: 'awesome product name'
    third_order_id: '20150101030320204',
    amount: 100, # in cents
    client_ip: '127.0.0.1',
    notify_url: 'http://example.com/notify',
  }

  body = LeshuaPay::Service.scan_code_pay(options)
```

### 条码支付
```ruby
options = {
  body: 'awesome product name'
  third_order_id: '20150101030320204',
  auth_code: 'http://www.baidu.com',
  amount: 100,
  client_ip: '127.0.0.1',
  notify_url: 'http://example.com/notify',
}

body = LeshuaPay::Service.barcode_pay(options)

```

### Refund/退款
```ruby
options = {
  third_order_id: "asdfwfa3231214",
  refund_amount: 1,
  merchant_refund_id: SecureRandom.base64(64)
}
LeshuaPay::Service.refund(options)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/LeshuaPay/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
