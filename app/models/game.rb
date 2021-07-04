class Game < ApplicationRecord
  STATUS = %w[cracked uncracked unreleased].freeze

  validates :name, presence: true, uniqueness: true
  validates :status, inclusion: { in: STATUS }

  validates :release_date, presence: true, unless: :unreleased?
  validates :anti_tamper, presence: true, unless: :unreleased?
  validates :image_url, presence: true, unless: :unreleased?
  validates :store_url, presence: true, unless: :unreleased?
  validates :cracked_by, presence: false, if: :cracked?
  validates :crack_date, presence: true, if: :cracked?

  scope :unreleased, -> { where(status: 'unreleased') }
  scope :uncracked, -> { where(status: 'uncracked') }

  def unreleased?
    status == 'unreleased'
  end

  def cracked?
    status == 'cracked'
  end
end
