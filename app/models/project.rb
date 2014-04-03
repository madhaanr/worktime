class Project < ActiveRecord::Base
  validates :name, uniqueness: true,
            length: {minimum: 3}
  has_many :tasks, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :entries, through: :user_projects
end
