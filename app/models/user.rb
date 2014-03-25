class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true,
                       length: {minimum: 3}
  validates :password, presence: true,
                       length: {minimum: 4},
                       format: {with:/[A-Z]+/, with:/[0-9]+/}
  has_many :user_projects
  has_many :projects, through: :user_projects
end
