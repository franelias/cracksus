module V1
  module Sessions
    class Mount < Grape::API
      helpers Helpers::LoginHelpers

      mount Sessions::Identity
    end
  end
end
