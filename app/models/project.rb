class Project < ActiveRecord::Base
  belongs_to  :phase
  has_many    :posts
  has_many    :subscriptions
  has_many    :users, through: :subscriptions

  default_scope order('created_at DESC')
  before_create :set_phase_to_onboarding

  def set_phase_to_onboarding
    self.phase_id = Phase.first.id
  end


end
