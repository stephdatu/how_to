class Task < ActiveRecord::Base
  belongs_to :instruction
  attr_accessible :task

  validates :task, :presence => true
end
