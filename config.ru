# require 'sinatra/base'
require 'sinatra'
require 'sinatra/reloader'
require './lib/app'
require 'sass/plugin/rack'
require 'redcarpet'

# Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each { |f| require f }

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack
# run Blog
run Sinatra::Application