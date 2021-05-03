class User < ApplicationRecord

  ROLES = %w[user admin].freeze

  validates :username, presence: true
  validates :password, presence: true
  validates :mail, presence: true
  validates :status, presence: true
  validates :role, inclusion: { in: ROLES }

  has_many :games
end