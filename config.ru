# require 'sinatra/base'
# require 'sinatra/reloader'
require './app'
require 'sass/plugin/rack'

# Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each { |f| require f }

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack
# run Blog
run Sinatra::Application