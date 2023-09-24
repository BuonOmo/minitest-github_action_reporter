require 'minitest'

require_relative 'github_action_reporter'

# Update Minitest with Plugin data.
module Minitest
  def self.plugin_github_action_reporter_init(options)
  	return unless ENV.key?("GITHUB_STEP_SUMMARY")

    file = File.open(ENV["GITHUB_STEP_SUMMARY"], "w")
    Minitest.reporter << GithubActionReporter.new(file)
  end
end
