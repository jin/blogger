class Article < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  # If tags exist, get the name of each tag, reject empty names and join them with a 
  # space delimiter.
  def tag_list
    tags.map{ |tag| tag.name }.reject(&:empty?).join(" ")
  end

  # If they don't exist, create tags from the string of tags. 
  # Split with spaces/commans -> strip whitespace -> downcase -> remove dups
  def tag_list=(tags_string)
    tag_names = tags_string.split(/[\s,","]/).map{ |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
