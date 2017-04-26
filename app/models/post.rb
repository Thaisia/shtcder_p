class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :text, presence: true

  has_many :comments
  belongs_to :user

  self.per_page = 10

  def subject
    title
  end

  def last_comment
    comments.last
  end

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("text LIKE ?", "%#{search}%")
  end

end
