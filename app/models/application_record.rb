class ApplicationRecord < ActiveRecord::Base
  has_secure_password
  self.abstract_class = true
end
