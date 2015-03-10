require 'spec_helper'


describe WechatMP do
  context "Testing endpoint access via methods" do
    let(:client) { WechatMP::Client.create }

    it "should find the health endpoint" do
      expect(client.datacube.class).to eql(WechatMP::Endpoints::Datacube)
    end
  end
end
