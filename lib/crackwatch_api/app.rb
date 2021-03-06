# frozen_string_literal: true

module CrackwatchApi
  class App
    class << self
      def session_expire_time
        ENV['session_expire_time'] || 10.minutes.seconds
      end
    end
  end
end
