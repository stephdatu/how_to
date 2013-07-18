class Instruction < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :tasks, :dependent => :delete_all
end
