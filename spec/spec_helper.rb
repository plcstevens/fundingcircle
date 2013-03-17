require 'thor'
require 'thor/group'
require "rspec"
require "fundingcircle"

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
