class User < ActiveRecord::Base
  attr_accessible :age, :email, :last_name, :name
  validates :name, :last_name, presence: true
  validates :email, format: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/

  has_many :books, dependent: :destroy

  scope :name_or_last_name, lambda { |string|
  	where("name LIKE ? OR last_name LIKE ?", "%#{string}%", "%#{string}%")
  }

  scope :between_ages, lambda { |first_age, last_age|
  	where(age: first_age..last_age)
  }
end
