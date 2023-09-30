
unless ENV.key?("GITHUB_STEP_SUMMARY")
  FileUtils.touch("test.txt")
  ENV['GITHUB_STEP_SUMMARY'] = 'test.txt'
end

require 'minitest/autorun'

require_relative '../lib/minitest/github_action_reporter_plugin'

class Test < Minitest::Test
  def test_that_passes
    assert_equal 1, 1
  end

  def test_that_fails
    assert_equal 1, 2
  end

  def test_that_skips
    skip "Skipped"
  end

  def test_that_errors
    raise "Error"
  end
end
