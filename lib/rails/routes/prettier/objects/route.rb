# frozen_string_literal: true

module Rails
  module Routes
    module Prettier
      module Objects
        class Route
          attr_reader :route

          def initialize(route)
            @route = route
          end

          def name
            route[:name]
          end

          def verb
            route[:verb]
          end

          def path
            route[:path].gsub(/(\(\.:format\))$/, '')
          end

          def reqs
            route[:reqs]
          end

          def controller
            return nil if redirect? || custom_router? || basic_auth?

            reqs.split('#').first.split('/').map(&:camelize).join('::').concat('Controller')
          end

          def action
            return nil if redirect? || custom_router? || basic_auth?

            reqs.split('#').last.split(' ').first
          end

          # rubocop:disable Security/Eval
          def req_options
            return {} if redirect? || basic_auth?

            begin
              eval(reqs.split("#{action} ").last)
            rescue StandardError
              {}
            end
          end
          # rubocop:enable Security/Eval

          def to_h
            {
              name: name,
              verb: verb,
              path: path,
              controller: controller,
              action: action,
              req_options: req_options
            }
          end

          def to_json(*_args)
            to_h.to_json
          end

          # rubocop:disable Layout/LineLength
          def to_s
            "<Route name: '#{name}', verb: '#{verb}', path: '#{path}', controller: '#{controller}', action: '#{action}' req_options: #{req_options}>"
          end
          # rubocop:enable Layout/LineLength

          def inspect
            "##{self}"
          end

          def redirect?
            reqs.match?(/redirect(.*,|.*$)/)
          end

          def basic_auth?
            reqs.start_with?('#<Rack::Auth::Basic')
          end

          def custom_router?
            reqs.start_with?('#<')
          end
        end
      end
    end
  end
end
