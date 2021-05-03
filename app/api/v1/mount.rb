module V1
  class Mount < Grape::API

    mount Public::Mount => '/public'
  end 
end
