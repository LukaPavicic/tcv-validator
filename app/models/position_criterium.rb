class PositionCriterium < ApplicationRecord
  belongs_to :position
  has_many :job_application_requirements

  validates :criteria_value, presence: true

  scope :required, -> { where(required: true) }
  scope :not_required, -> { where(required: false) }
end
