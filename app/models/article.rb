class Article < ApplicationRecord
  has_one :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end

