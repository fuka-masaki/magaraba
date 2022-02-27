class Post < ApplicationRecord
  validates :content, {presence: true}
  validates :content, {length:{maximum: 5000}}
  validates :user_id,{presence: true}
  scope :recent, -> { order(created_at: :desc)}
end
