class User < ActiveRecord::Base
  belongs_to :role

  attr_accessible :full_name, :role
end
