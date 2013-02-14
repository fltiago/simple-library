class Book < ActiveRecord::Base
  attr_accessible :edition, :name

  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user

  scope :recents, order("created_at ASC").limit(5)

  def self.static_recents(user_id)
  	where(user_id: user_id).
  	order("created_at ASC").limit(5)
  end
end
