module V1
  module Helpers
    module ApiHelpers
      def current_user
        if env[:current_payload].nil?
          @current_user = nil
        else
          @current_user ||= User.find_by!(id: env[:current_payload][:id])
        end
      end

      def authenticate!
        current_user || raise(CrackwatchApi::Error::Authentication)
      end
    end
  end
end
