class Task < ActiveRecord::Base
  validates :name,presence: true,
            length: {minimum: 3}
  belongs_to :project
  has_many :entries
end
