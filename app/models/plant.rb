class Plant < ApplicationRecord 
   belongs_to :user 

   validates :seed_name, presence:true, length: {minimum: 3, maximum: 60} 
   validates :amount, presence:true
   validates :weeks_to_mature, presence:true 
   validates :growing_season, presence:true, length: {minimum: 3, maximum: 20} 
   validates :has_been_planted, presence:true
   validates :when_planted, presence:true

end