require 'saddle'
require 'saddle/middleware/authentication/oauth2'

module WechatMP
  class Client < Saddle::Client
    def self.host
      'api.weixin.qq.com'
    end

    def self.use_ssl
      true
    end

    add_middleware({
      :klass => Saddle::Middleware::Authentication::OAuth2,
      :args => ['access_token'],
    })
  end
end
