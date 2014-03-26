class UserProject < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :users
  has_many :projects
end
