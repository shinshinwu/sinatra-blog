class Entry < ActiveRecord::Base
  # Remember to create a migration!
  has_many :filters
  has_many :tags, through: :filters

  validates :body, :title, :author, { :presence => true }

  validates :body, { :uniqueness => true }

  def add_tags(tags)
    tags_array = tags.split(" ")
    tags_array.each do |tag|
      Tag.create(name: tag) if Tag.find_by(name: tag).nil?
      self.tags << Tag.find_by(name: tag) unless self.tags.include? tag
    end
  end

end
