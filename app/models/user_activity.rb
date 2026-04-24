class UserActivity < ApplicationRecord
  belongs_to :concept

  validates :user_id, :activity_date, presence: true
  validates :concept_id, uniqueness: { scope: [ :user_id, :activity_date ] }

  scope :for_user, ->(user_id) { where(user_id: user_id) }
  scope :between, ->(from, to) { where(activity_date: from..to) }
end
