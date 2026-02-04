class Tweet < ApplicationRecord
  belongs_to :user

  scope :by_user_id, -> (user_id) { where(user_id: user_id) if user_id.present? }
  scope :by_username, -> (username) { joins(:user).where('users.username LIKE ?', username) if username.present? }
end
