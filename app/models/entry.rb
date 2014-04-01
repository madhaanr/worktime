class Entry < ActiveRecord::Base
  belongs_to :user_project
  has_one :user, through: :user_project
  has_one :project, through: :user_project
  belongs_to :task
end
