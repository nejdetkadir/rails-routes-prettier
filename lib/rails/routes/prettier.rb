# frozen_string_literal: true

require_relative 'prettier/version'
require_relative 'prettier/objects/route'
require_relative 'prettier/formatter'
require 'rails'

module Rails
  module Routes
    module Prettier
      class << self
        SEARCHABLE_FIELDS = %i[name verb path req_options controller action].freeze

        def all
          ActionDispatch::Routing::RoutesInspector.new(::Rails.application.routes.routes).format(
            Rails::Routes::Prettier::Formatter.new, {}
          )
        end

        SEARCHABLE_FIELDS.each do |field|
          define_method :"find_by_#{field}" do |value|
            all.select { |route| route.send(field) == value }
          end
        end
      end
    end
  end
end
