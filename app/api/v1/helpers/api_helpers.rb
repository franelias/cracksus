module V1
  module Helpers
    module ApiHelpers
      def current_user
        @current_user ||= User.find_by!(id: env[:current_payload][:id]) unless env[:current_payload].nil?
      end

      def authenticate!
        current_user || raise(CrackwatchApi::Error::Authentication)
      end
    end
  end
end
