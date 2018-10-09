require 'pry'
require 'leshua_pay'


LeshuaPay.configure do |w|
  w.payment_key = 'test_key'
end