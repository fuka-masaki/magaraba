class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :comic
  has_many :likes, dependent: :destroy
  validates :Manga_name, {presence: true}
  validates :content, {presence: true}
  validates :content, {length:{maximum: 5000}}
  validates :user_id,{presence: true}
  scope :recent, -> { order(created_at: :desc)}
  is_impressionable counter_cache: true
end