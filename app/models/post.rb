class Post < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user

	def word_count
    content.split.size
  end

  def reading_time
    (word_count / 180.0).ceil
  end 
end