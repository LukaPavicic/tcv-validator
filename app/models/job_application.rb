class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :position

  has_many :job_application_requirements, dependent: :destroy
  has_many :position_criteriums, through: :job_application_requirements

  validates :cv_text, presence: true
  validates :applicant_full_name, presence: true

  enum status: { in_process: 0, rejected: 1, accepted: 2, on_hold: 3 }

  def all_required_criteriums_satisfied?
    position_criteriums.required.each do |crit|
      return false unless crit.job_application_requirements.first.satisfied
    end

    true
  end

  def all_bonus_criteriums_satisfied?
    position_criteriums.not_required.each do |crit|
      return false unless crit.job_application_requirements.first.satisfied
    end

    true
  end
end
