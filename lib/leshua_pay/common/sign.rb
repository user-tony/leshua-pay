module LeshuaPay
  module Common
    module Sign

      class << self
        def to_param options
          options.select{ |k,v| v.present? }.sort.map{ |k,v| "#{k}=#{v}" }.join('&')
        end

        def md5 options
          str = to_param options
          str << "&key=#{Config.payment_key}"
          Digest::MD5.hexdigest(str).upcase
        end

        def signature options
          to_param(options)+"&sign="+md5(options)
        end

        def valid? options
          md5(options) == options.delete("sign")
        end

      end
    end
  end
end
