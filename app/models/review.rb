class Review < ActiveRecord::Base
    belongs_to :airlines
    belongs_to :users   
        def avg_score
        return 0 unless reviews.size.positive?
    
        reviews.average(:score).to_f.round(2)
      end
    
end