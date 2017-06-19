class Product < ActiveRecord::Base
  belongs_to :user
  has_one :purchase
  has_one :buyer, through: :purchase, source: :user
  validates :name, :amount, presence: true

end
