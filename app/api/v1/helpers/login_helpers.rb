module V1
  module Helpers
    module LoginHelpers
      def hexdigest_session(session_id)
        Digest::SHA256.hexdigest(session_id.to_s)
      end

      def key_name(user_uid, session_id)
        if session_id.present?
          hsid = hexdigest_session(session_id)
          "#{user_uid}session#{hsid}"
        end
      end

      def encrypted_session(session_id)
        "_session_id:1::#{hexdigest_session(session_id)}"
      end
    end
  end
end
