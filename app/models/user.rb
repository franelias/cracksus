class User < ApplicationRecord
  include AASM
  ROLES = %w[user admin].freeze

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :mail, presence: true, uniqueness: true
  validates :role, inclusion: { in: ROLES }

  has_many :games

  aasm column: :status do
    state :pending, initial: true
    state :active
    state :banned

    event :activate do
      transitions from: :pending, to: :active
    end

    event :ban do
      transitions from: :active, to: :banned
    end

    event :unban do
      transitions from: :banned, to: :active
    end
  end

  def admin?
    role == 'admin'
  end
end
