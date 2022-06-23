class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum making_status: { you_cannot_proceed: 0,
                        waiting_production: 1,
                        in_production: 2,
                        completed_production: 3
                      }
end
