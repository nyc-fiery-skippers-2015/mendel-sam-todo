class Task < ActiveRecord::Base
  belongs_to :list
  validates :body, presence: true
end
