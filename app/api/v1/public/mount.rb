module V1
  module Public
    class Mount < Grape::API

      mount Public::Games => '/games'
    end
  end
end