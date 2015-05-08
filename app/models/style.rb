class Style < ActiveRecord::Base
    has_many :recipe_styles
    has_many :recipes, through: :recipe_styles
    
   validate :name, presence: true, length: {minimum: 2, maximum: 25} 
end