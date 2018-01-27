class Artist < ApplicationRecord
	has_many :items
	has_many :songs

	validates :artist_name, presence: true
end
