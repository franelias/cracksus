module V1
  class Mount < Grape::API

    mount Public::Mount => '/public'
    mount Admin::Mount => '/admin'
    mount Users::Mount => '/users'
  end 
end
