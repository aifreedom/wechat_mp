require 'spec_helper'

describe WechatMP::Client do
  context "Testing endpoint action requests" do
    SECONDS_IN_DAY = 24 * 60 * 60

    let(:access_token) { 'fake_access_token' }
    let(:client) { WechatMP::Client.create(:access_token => access_token) }

    before do
      [:get, :post, :put, :delete].each do |method|
        client.requester.stub(method).and_return { nil }
      end
    end

    context "accessing datacube endpoints" do
      let!(:now) { Time.now }
      let!(:begin_date) { (now - SECONDS_IN_DAY * 5).to_date }
      let!(:end_date) { (now - SECONDS_IN_DAY * 3).to_date }

      ENDPOINT_METHODS = [
        :get_user_summary,
        :get_user_cumulate,
        :get_article_summary,
        :get_article_total,
        :get_user_read,
        :get_user_read_hour,
        :get_user_share,
        :get_user_share_hour,
        :get_upstream_msg,
        :get_upstream_msg_hour,
        :get_upstream_msg_week,
        :get_upstream_msg_month,
        :get_upstream_msg_dist,
        :get_upstream_msg_dist_week,
        :get_upstream_msg_dist_month,
        :get_interface_summary,
        :get_interface_summary_hour,
      ]

      ENDPOINT_METHODS.each do |endpoint_method|
        endpoint_url = endpoint_method.to_s.gsub('_', '')

        it "hits #{endpoint_url} when calling #{endpoint_method}" do
          expect(client.requester).to receive(:post) do |url, params|
            expect(url).to eql("/datacube/#{endpoint_url}")
            expect(params).to eql(
              :begin_date => begin_date.to_s,
              :end_date => end_date.to_s,
            )
          end
          client.datacube.send(endpoint_method, begin_date, end_date)
        end
      end
    end

    context "accessing sna endpoints" do
      let!(:open_id) { 'openid' }
      it "hits userinfo when calling #user_info" do
          expect(client.requester).to receive(:get) do |url, params|
            expect(url).to eql("/sns/userinfo")
            expect(params).to eql(
              :openid => open_id,
            )
          end
          client.sns.user_info(open_id)
      end
    end
  end
end
