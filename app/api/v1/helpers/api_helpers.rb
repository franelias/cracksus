module V1
  module Helpers
    module ApiHelpers
      def current_user
        unless env[:current_payload].nil?
          @current_user ||= User.find_by!(id: env[:current_payload][:id])
        else
          @current_user = nil
        end
      end
    end
  end
end
