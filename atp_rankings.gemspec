# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'atp_rankings/version'

Gem::Specification.new do |spec|
  spec.name          = "atp_rankings"
  spec.version       = AtpRankings::VERSION
  spec.authors       = ["evanscloud"]
  spec.email         = ["dijkstrascloud@gmail.com"]

  spec.summary       = "Rubygem that provides info for the top 8 ATP singles athletes contending for the World Tour Finals."
  spec.homepage      = "https://github.com/evanscloud/atp-rankings-cli-gem"
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
