class JobApplicationRequirement < ApplicationRecord
  belongs_to :job_application
  belongs_to :position_criterium

  def satisfy!
    self.satisfied = true
    self.save!
  end
end
