class Book < ApplicationRecord
    
    belongs_to :user
    
    has_one_attached :profileimage
    
    validates :title, presence: true
    validates :body, presence: true
    
end
