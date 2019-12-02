class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:visitor, :author, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :posts
  validates :name, presence: true
  has_many :likes, dependent: :destroy

  def set_default_role
    self.role ||= :visitor
  end
end
