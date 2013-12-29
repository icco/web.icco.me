#!/usr/bin/env rackup
# encoding: utf-8

# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

Bundler.require(:default, RACK_ENV)
require './app'

run Sinatra::Application
