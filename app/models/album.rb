class Album < ActiveRecord::Base
	validates :name, presence: true
  	validates :artist, presence: true
end
