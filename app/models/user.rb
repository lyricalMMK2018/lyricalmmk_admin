class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :orders
         has_many :carts

         enum gender: { Male: 0, Female: 1, Secret: 2 }

        validates :firstname, presence: true, length: { maximum: 128 }
        validates :lastname, presence: true, length: { maximum: 128 }
        validates :firstname_kana, presence: true, length: { maximum: 128 }
        validates :lastname_kana, presence: true, length: { maximum: 128 }
        validates :age, presence: true, numericality: { less_than: 128 }
end
