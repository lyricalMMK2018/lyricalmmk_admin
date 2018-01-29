class Genre < ApplicationRecord
	has_many :items, dependent: :nullify

	validates :genre_name, presence: true, length: { maximum: 256 }
end
