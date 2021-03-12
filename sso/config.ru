# frozen_string_literal: true

require "bundler/setup"
require "hanami/api"
require_relative "lib/app"

run App.new
