class Post < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	validates :author_id, presence: true
end
