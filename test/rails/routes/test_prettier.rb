# frozen_string_literal: true

require 'test_helper'

module Rails
  module Routes
    class TestPrettier < Minitest::Test
      def test_that_it_has_a_version_number
        refute_nil ::Rails::Routes::Prettier::VERSION
      end
    end
  end
end
