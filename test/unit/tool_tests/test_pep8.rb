#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../test_helper.rb'
require_relative 'mock_runner'

require 'quality/tools/pep8'

# Unit test the Task class
class TestPep8 < MiniTest::Test
  def test_pep8
    lines = [
      'Usage: something something something',
      'pep8: something something something',
      'real line',
    ]
    m = MockRunner.new(lines)
    assert_equal(1, m.run('pep8'))
  end
end
