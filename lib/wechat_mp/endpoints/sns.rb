require 'saddle/endpoint'

module WechatMP
  module Endpoints
    class Sns < Saddle::TraversalEndpoint
      def user_info(open_id)
        get('userinfo', :openid => open_id)
      end
    end
  end
end
