module Minitest
  # Define our custom reporter.
  class GithubActionReporter < Minitest::StatisticsReporter
    STATS_FORMAT = 'Finished in %.6fs, %.4f runs/s, %.4f assertions/s.'.freeze

    def initialize(io)
      super
      @io = io
    end

    def report
      super
      io.puts "# Test summary"
      io.puts
      io.puts statistics

      if failures + errors == 0
        puts "Every #{count} tests passed :taco:"
      else
        io.puts "<table>"
        io.puts "<tr><th>Name</th><th>Message</th></tr>"
        results.reject(&:skipped?).each_with_index do |result, i|
          loc = result.failure.location
          name = "#{result.class_name}##{result.name}"
          io.puts "<tr><td>#{i+1}</td><td><a href='#{gh_link(loc)}'>#{name}</a></td><td><pre>#{result.failure.message}</pre></td></tr>"
        end
        io.puts "</table>"
      end
    end

    def statistics
      format(STATS_FORMAT,
             total_time, count / total_time,
             assertions / total_time)
    end

    # TODO: we can guess further, for instance if a Rails.root exist.
    def gh_link(loc)
      path, _, line = loc[%r(/(?:test|spec|lib)/.*)][1..].rpartition(":")

      "#{ENV["GITHUB_SERVER_URL"]}/#{ENV["GITHUB_REPOSITORY"]}/blob/#{ENV["GITHUB_SHA"]}/#{path}#L#{line}"
    end
  end
end
