class Post < ActiveRecord::Base
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many  :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

	has_attached_file :image, styles: { medium: "300x400#", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
