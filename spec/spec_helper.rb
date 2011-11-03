require 'rubygems'
require 'spork'
require 'ohm'
require 'mock_redis'
require 'bookstore/book'
require 'bookstore/author'

# I'm leveraging MockRedis so the tests don't require a running Redis server to be running.
# MockRedis is a _nearly_ complete Redis implementation.  Unfortunately, one of the pieces
# not implemented is the Redis.connect method.  To over come this, I've extended MockRedis
# and supplied a connect method.  Any future methods that aren't implemented can be added
# here as well.
class ConnectableMockRedis < MockRedis
  def self.connect(attrs = {})
    MockRedis.new
  end
end

# In order to trick Ohm to use MockRedis, I need to have the Redis class point to my mock
# implementation instead.
Redis = ConnectableMockRedis

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  
end

Spork.each_run do
  # This code will be run each time you run your specs.
  
end

# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading 
#   code that you don't normally modify during development in the 
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#
