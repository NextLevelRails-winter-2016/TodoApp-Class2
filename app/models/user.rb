class User < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks

  def due_today
    self.tasks.select{ |t| t.due_date.to_date == DateTime.now.to_date }
  end
end
