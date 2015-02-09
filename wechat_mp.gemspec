require File.expand_path('../lib/wechat_mp/version', __FILE__)

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name    = 'wechat_mp'
  s.version = WechatMP::VERSION
  s.summary = "WeChat MP's server and API client in Ruby."
  s.authors = ['Song Xie']

  s.add_dependency 'saddle', '~> 0.0.52'
end
