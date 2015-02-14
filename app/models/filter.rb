class Filter < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :entry
  belongs_to :tag
end
