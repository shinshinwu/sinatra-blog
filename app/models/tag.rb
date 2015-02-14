class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :filters
  has_many :entries, through: :tags
end
