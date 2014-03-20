class Article < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, presence: true
end
