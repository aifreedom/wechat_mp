# WeChat MP

## Description

This is a server SDK and API client for WeChat MP in Ruby.

## Usage

### API Client

The API documentation from WeChat can be found at http://mp.weixin.qq.com/wiki/home/index.html.

    require 'wechat_mp/client'
    client = WechatMP::Client.create(access_token)

    SECONDS_IN_DAY = 24 * 60 * 60
    now = Time.now
    begin_date = (now - SECONDS_IN_DAY * 5).to_date
    end_date = (now - SECONDS_IN_DAY * 3).to_date

    user_summary = client.datacube.get_user_summary(begin_date, end_date)
