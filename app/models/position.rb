class Position < ApplicationRecord
  belongs_to :user

  has_many :position_criteriums, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
