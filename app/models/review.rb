class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  validates :text, :presence => true

end
