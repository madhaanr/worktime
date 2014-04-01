class Project < ActiveRecord::Base
  has_many :tasks
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :entries, through: :user_projects
end
