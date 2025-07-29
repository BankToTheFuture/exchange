# -*- encoding: utf-8 -*-
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'exchange/base'

Gem::Specification.new do |s|
  s.name              = "exchange"
  s.version           = Exchange::VERSION
  s.authors           = ["Beat Richartz"]
  s.description       = "Simple Money handling for your ruby app – ISO4217-compatible Currency instantiation, conversion, string formatting and more via an intuitive DSL: 1.in(:usd).to(:eur)"
  s.email             = "attr_accessor@gmail.com"
  s.homepage          = "http://beatrichartz.github.io/exchange"
  s.licenses          = ["MIT"]
  s.require_paths     = ["lib"]
  s.summary           = "Simple Money handling for your ruby app"
  s.extensions        = 'ext/mkrf_conf.rb'

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")
  s.require_paths     = ["lib"]

  s.add_dependency             "bigdecimal"
  s.add_dependency             "nokogiri"

  s.add_development_dependency "json"
  s.add_development_dependency "yard"
  s.add_development_dependency "bundler"
  s.add_development_dependency "pry"

  if RUBY_ENGINE == 'rbx'
    s.add_development_dependency "rubysl-bigdecimal"
    s.add_development_dependency "rubysl-singleton"
    s.add_development_dependency "racc"
  end
end
