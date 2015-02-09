require 'saddle/endpoint'

module WechatMP
  module Endpoints
    class Datacube < Saddle::TraversalEndpoint
      ENDPOINT_METHODS = [
        # Users
        :get_user_summary,
        :get_user_cumulate,

        # Articles
        :get_article_summary,
        :get_article_total,
        :get_user_read,
        :get_user_read_hour,
        :get_user_share,
        :get_user_share_hour,

        # Messages
        :get_upstream_msg,
        :get_upstream_msg_hour,
        :get_upstream_msg_week,
        :get_upstream_msg_month,
        :get_upstream_msg_dist,
        :get_upstream_msg_dist_week,
        :get_upstream_msg_dist_month,

        # API Calls
        :get_interface_summary,
        :get_interface_summary_hour,
      ]

      ENDPOINT_METHODS.each do |endpoint_method|
        define_method endpoint_method do |begin_date, end_date|
          endpoint_url = endpoint_method.to_s.gsub('_', '')
          post(
            endpoint_url,
            :begin_date => begin_date.to_s,
            :end_date => end_date.to_s,
          )
        end
      end
    end
  end
end
