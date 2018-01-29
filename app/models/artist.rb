class Artist < ApplicationRecord
	has_many :items, dependent: :nullify
	has_many :songs, dependent: :nullify

	validates :artist_name, presence: true
end
