class User < ApplicationRecord

  ROLES = %w[user admin].freeze
  STATUS = %w[verified active banned].freeze

  validates :username, presence: true
  validates :password, presence: true
  validates :mail, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :role, inclusion: { in: ROLES }

  has_many :games
end