class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :books, dependent: :destroy

         has_many :likes, dependent: :destroy
         has_many :liked_books, through: :likes, source: :book
         has_many :comments, dependent: :destroy

         has_many :books, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
  mount_uploader :image, ImageUploader
 
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

  has_many :followings, through: :following_relationships
 
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
 
  has_many :followers, through: :follower_relationships
 
   def following?(other_user)
     following_relationships.find_by(following_id: other_user.id)
   end
 
   def follow!(other_user)
     following_relationships.create!(following_id: other_user.id)
   end
 
   def unfollow!(other_user)
     following_relationships.find_by(following_id: other_user.id).destroy
   end
         def already_liked?(book)
          self.likes.exists?(book_id: book.id)
        end
end
