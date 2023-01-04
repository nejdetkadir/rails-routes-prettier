# frozen_string_literal: true

module Rails
  module Routes
    module Prettier
      class Formatter
        attr_reader :routes

        def initialize
          @routes = []
        end

        def section_title(title); end

        def header(routes); end

        def result
          routes
        end

        def section(routes)
          routes.map do |route|
            @routes << Rails::Routes::Prettier::Objects::Route.new(route)
          end
        end
      end
    end
  end
end
